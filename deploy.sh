#!/usr/bin/env bash
# Donut site deploy — push to GitHub and enable Pages.
# Usage: ./deploy.sh "optional commit message"
set -euo pipefail
cd "$(dirname "$0")"

GIT_URL="https://github.com/DONUT_OWNER/donut-co.git"

if ! git ls-remote "$GIT_URL" >/dev/null 2>&1; then
  echo "ERROR: remote not reachable. Set your GitHub username in deploy.sh (replace DONUT_OWNER)."
  exit 1
fi

git add -A
git commit -m "${1:-Update Donut site}" || echo "(no changes to commit)"
git push -u origin main

echo ""
echo "Deployed. Live at: https://DONUT_OWNER.github.io/donut-co/"
echo "Custom domain later: add CNAME file + DNS, then enable in repo Settings > Pages."