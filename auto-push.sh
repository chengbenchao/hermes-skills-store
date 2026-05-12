#!/bin/bash
# Auto-commit and push new skills to GitHub
# Runs via cron every 10 minutes

set -e
cd ~/.hermes/skills-store

# Skip if no changes
if git diff --quiet && git diff --cached --quiet && [ -z "$(git ls-files --others --exclude-standard)" ]; then
  exit 0
fi

# Commit and push (via proxy — VPC blocks GitHub)
export HTTPS_PROXY=http://127.0.0.1:7890
git add -A
git commit -m "auto: skill sync $(date +%Y-%m-%d)" || true
git push origin main
