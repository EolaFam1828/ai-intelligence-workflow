#!/usr/bin/env bash

set -euo pipefail

ROOT_DIR="${1:-.}"
TERMS_FILE="${TERMS_FILE:-${ROOT_DIR}/.portfolio-sensitive-terms.txt}"
ALLOWLIST_FILE="${ALLOWLIST_FILE:-${ROOT_DIR}/.portfolio-sanity-allowlist.txt}"
SENSITIVE_TERMS_REGEX="${SENSITIVE_TERMS_REGEX:-}"

TMP_DIR="$(mktemp -d)"
trap 'rm -rf "${TMP_DIR}"' EXIT

# Terms file format: one regex fragment per line, ignore blank lines and comments.
if [[ -z "${SENSITIVE_TERMS_REGEX}" && -f "${TERMS_FILE}" ]]; then
  TERM_LINES=()
  while IFS= read -r line; do
    TERM_LINES+=("${line}")
  done < <(grep -vE '^[[:space:]]*(#|$)' "${TERMS_FILE}" || true)
  if [[ "${#TERM_LINES[@]}" -gt 0 ]]; then
    SENSITIVE_TERMS_REGEX="$(IFS='|'; echo "${TERM_LINES[*]}")"
  fi
fi

# Allowlist format: one regex per line that matches a finding line to suppress.
ALLOWLIST_REGEX=""
if [[ -f "${ALLOWLIST_FILE}" ]]; then
  ALLOWLIST_LINES=()
  while IFS= read -r line; do
    ALLOWLIST_LINES+=("${line}")
  done < <(grep -vE '^[[:space:]]*(#|$)' "${ALLOWLIST_FILE}" || true)
  if [[ "${#ALLOWLIST_LINES[@]}" -gt 0 ]]; then
    ALLOWLIST_REGEX="$(IFS='|'; echo "${ALLOWLIST_LINES[*]}")"
  fi
fi

# Lightweight secret-pattern scan for common key formats and token prefixes.
SECRET_PATTERNS_REGEX='(AKIA[0-9A-Z]{16}|ASIA[0-9A-Z]{16}|-----BEGIN (RSA|EC|OPENSSH) PRIVATE KEY-----|sk-[A-Za-z0-9]{20,}|xox[baprs]-[A-Za-z0-9-]{10,}|ghp_[A-Za-z0-9]{36,}|AIza[0-9A-Za-z_-]{35}|BEGIN PRIVATE KEY)'

EXCLUDE_GLOBS=(
  "--glob=!**/.git/**"
  "--glob=!**/node_modules/**"
  "--glob=!**/*.png"
  "--glob=!**/*.jpg"
  "--glob=!**/*.jpeg"
  "--glob=!**/*.gif"
  "--glob=!**/*.pdf"
  "--glob=!**/*.svg"
  "--glob=!**/scripts/sanity_check_portfolio.sh"
  "--glob=!**/.portfolio-sensitive-terms.txt"
  "--glob=!**/.portfolio-sensitive-terms.example.txt"
  "--glob=!**/.portfolio-sanity-allowlist.txt"
  "--glob=!**/.portfolio-sanity-allowlist.example.txt"
)

filter_allowlist() {
  local input_file="$1"
  local output_file="$2"
  if [[ -n "${ALLOWLIST_REGEX}" ]]; then
    grep -E -v "${ALLOWLIST_REGEX}" "${input_file}" >"${output_file}" || true
  else
    cp "${input_file}" "${output_file}"
  fi
}

run_rg_scan() {
  local label="$1"
  local rg_flags="$2"
  local pattern="$3"
  local raw_file="${TMP_DIR}/${label}.raw.txt"
  local filtered_file="${TMP_DIR}/${label}.filtered.txt"

  # shellcheck disable=SC2086
  rg -n ${rg_flags} "${pattern}" "${ROOT_DIR}" "${EXCLUDE_GLOBS[@]}" >"${raw_file}" || true
  filter_allowlist "${raw_file}" "${filtered_file}"

  if [[ -s "${filtered_file}" ]]; then
    cat "${filtered_file}"
    return 1
  fi
  return 0
}

check_markdown_links() {
  local raw_file="${TMP_DIR}/markdown_links.raw.txt"
  local filtered_file="${TMP_DIR}/markdown_links.filtered.txt"
  : >"${raw_file}"

  while IFS= read -r md; do
    local dir
    dir="$(dirname "${md}")"

    while IFS= read -r target; do
      target="${target%% *}"   # remove optional markdown title
      target="${target#<}"
      target="${target%>}"

      [[ -z "${target}" ]] && continue
      [[ "${target}" == http://* ]] && continue
      [[ "${target}" == https://* ]] && continue
      [[ "${target}" == mailto:* ]] && continue
      [[ "${target}" == \#* ]] && continue

      local path_only
      path_only="${target%%#*}"
      [[ -z "${path_only}" ]] && continue

      local candidate
      if [[ "${path_only}" == /* ]]; then
        candidate="${ROOT_DIR}/${path_only#/}"
      else
        candidate="${dir}/${path_only}"
      fi

      if [[ ! -e "${candidate}" ]]; then
        echo "${md}:${target}" >>"${raw_file}"
      fi
    done < <(perl -ne 'while(/\[[^\]]*\]\(([^)]+)\)/g){print "$1\n"}' "${md}")
  done < <(find "${ROOT_DIR}" -type f -name '*.md' | sort)

  filter_allowlist "${raw_file}" "${filtered_file}"

  if [[ -s "${filtered_file}" ]]; then
    cat "${filtered_file}"
    return 1
  fi
  return 0
}

run_external_secret_scanner() {
  local findings_file="${TMP_DIR}/external_secret_scanner.txt"
  : >"${findings_file}"

  if command -v gitleaks >/dev/null 2>&1; then
    if ! gitleaks detect --source "${ROOT_DIR}" --no-git --redact --exit-code 1 >"${findings_file}" 2>&1; then
      cat "${findings_file}"
      return 1
    fi
    echo "gitleaks: no findings."
    return 0
  fi

  if command -v trufflehog >/dev/null 2>&1; then
    trufflehog filesystem --json "${ROOT_DIR}" >"${findings_file}" 2>/dev/null || true
    if [[ -s "${findings_file}" ]]; then
      cat "${findings_file}"
      return 1
    fi
    echo "trufflehog: no findings."
    return 0
  fi

  echo "Skipped dedicated secret scanner (install gitleaks or trufflehog to enable this check)."
  return 0
}

echo "Running public-portfolio sanity checks in: ${ROOT_DIR}"
echo

sensitive_fail=0
secret_fail=0
link_fail=0
external_secret_fail=0

echo "[1/4] Scanning for sensitive/domain-specific terms..."
if [[ -z "${SENSITIVE_TERMS_REGEX}" ]]; then
  echo "Sensitive-term scan skipped. Provide SENSITIVE_TERMS_REGEX or ${TERMS_FILE}."
else
  if ! run_rg_scan "sensitive_terms" "-i" "${SENSITIVE_TERMS_REGEX}"; then
    sensitive_fail=1
    echo
    echo "Found potential sensitive language. Review and redact before publishing."
  else
    echo "No sensitive language hits."
  fi
fi

echo
echo "[2/4] Scanning for potential secrets (regex scanner)..."
if ! run_rg_scan "secret_patterns" "" "${SECRET_PATTERNS_REGEX}"; then
  secret_fail=1
  echo
  echo "Found potential secret patterns. Remove or rotate before publishing."
else
  echo "No secret-pattern hits."
fi

echo
echo "[3/4] Checking markdown links/images..."
if ! check_markdown_links; then
  link_fail=1
  echo
  echo "Found unresolved markdown links or image references."
else
  echo "All markdown links/images resolved."
fi

echo
echo "[4/4] Running dedicated secret scanner (if available)..."
if ! run_external_secret_scanner; then
  external_secret_fail=1
  echo
  echo "Dedicated secret scanner reported findings."
fi

echo
if [[ "${sensitive_fail}" -eq 0 && "${secret_fail}" -eq 0 && "${link_fail}" -eq 0 && "${external_secret_fail}" -eq 0 ]]; then
  echo "PASS: Portfolio checks completed with no findings."
  exit 0
fi

echo "FAIL: Resolve findings and rerun the check."
exit 1
