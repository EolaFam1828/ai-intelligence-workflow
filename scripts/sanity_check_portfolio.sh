#!/usr/bin/env bash

set -euo pipefail

ROOT_DIR="${1:-.}"
TERMS_FILE="${TERMS_FILE:-${ROOT_DIR}/.portfolio-sensitive-terms.txt}"

# Provide sensitive terms via:
# 1) SENSITIVE_TERMS_REGEX environment variable, or
# 2) TERMS_FILE path (default: ./.portfolio-sensitive-terms.txt)
# Terms file format: one regex fragment per line, lines starting with # are ignored.
SENSITIVE_TERMS_REGEX="${SENSITIVE_TERMS_REGEX:-}"

if [[ -z "${SENSITIVE_TERMS_REGEX}" && -f "${TERMS_FILE}" ]]; then
  mapfile -t TERM_LINES < <(grep -vE '^[[:space:]]*(#|$)' "${TERMS_FILE}" || true)
  if [[ "${#TERM_LINES[@]}" -gt 0 ]]; then
    SENSITIVE_TERMS_REGEX="$(IFS='|'; echo "${TERM_LINES[*]}")"
  fi
fi

# Lightweight secret-pattern scan for common key formats.
SECRET_PATTERNS_REGEX='(AKIA[0-9A-Z]{16}|ASIA[0-9A-Z]{16}|-----BEGIN (RSA|EC|OPENSSH) PRIVATE KEY-----|sk-[A-Za-z0-9]{20,}|xox[baprs]-[A-Za-z0-9-]{10,}|ghp_[A-Za-z0-9]{36,})'

EXCLUDE_GLOBS=(
  "--glob=!**/.git/**"
  "--glob=!**/node_modules/**"
  "--glob=!**/*.png"
  "--glob=!**/*.jpg"
  "--glob=!**/*.jpeg"
  "--glob=!**/*.gif"
  "--glob=!**/*.pdf"
  "--glob=!**/scripts/sanity_check_portfolio.sh"
  "--glob=!**/.portfolio-sensitive-terms.txt"
  "--glob=!**/.portfolio-sensitive-terms.example.txt"
)

echo "Running public-portfolio sanity checks in: ${ROOT_DIR}"
echo

sensitive_fail=0
secret_fail=0

echo "[1/2] Scanning for sensitive/domain-specific terms..."
if [[ -z "${SENSITIVE_TERMS_REGEX}" ]]; then
  echo "Sensitive-term scan skipped. Provide SENSITIVE_TERMS_REGEX or ${TERMS_FILE}."
else
  if rg -n -i "${SENSITIVE_TERMS_REGEX}" "${ROOT_DIR}" "${EXCLUDE_GLOBS[@]}"; then
    sensitive_fail=1
    echo
    echo "Found potential sensitive language. Review and redact before publishing."
  else
    echo "No sensitive language hits."
  fi
fi

echo
echo "[2/2] Scanning for potential secrets..."
if rg -n "${SECRET_PATTERNS_REGEX}" "${ROOT_DIR}" "${EXCLUDE_GLOBS[@]}"; then
  secret_fail=1
  echo
  echo "Found potential secret patterns. Remove or rotate before publishing."
else
  echo "No secret-pattern hits."
fi

echo
if [[ "${sensitive_fail}" -eq 0 && "${secret_fail}" -eq 0 ]]; then
  echo "PASS: Portfolio checks completed with no findings."
  exit 0
fi

echo "FAIL: Resolve findings and rerun the check."
exit 1
