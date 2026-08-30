#!/usr/bin/env bash
# Helper script to sync local changes to GitHub
set -e

MSG="${1:-Update website}"

cd "$(dirname "$0")"

echo "🔄 Staging changes..."
git add -A

echo "💾 Committing: $MSG"
git commit -m "$MSG" || echo "Nothing new to commit."

echo "🚀 Pushing to GitHub..."
git push -u origin main

echo "✅ Sync complete!"
