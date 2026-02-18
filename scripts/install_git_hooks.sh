#!/usr/bin/env bash

set -euo pipefail

REPO_ROOT="$(git rev-parse --show-toplevel)"
cd "${REPO_ROOT}"

if [[ ! -f ".githooks/pre-commit" ]]; then
  echo "Missing .githooks/pre-commit. Aborting."
  exit 1
fi

chmod +x .githooks/pre-commit
git config core.hooksPath .githooks

echo "Installed git hooks path: .githooks"
echo "Pre-commit hook will run scripts/sanity_check_portfolio.sh before each commit."
