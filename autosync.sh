#!/usr/bin/env bash
# Automatic Background Sync Script for GitHub Pages
# Runs in the background and continuously pushes changes whenever files are edited.

cd "$(dirname "$0")"

echo "=========================================="
echo "⚡ Auto-sync watcher started for my-website"
echo "   Any changes made by AI or you will be"
echo "   automatically committed & pushed to GitHub!"
echo "   (Press Ctrl+C to stop at any time)"
echo "=========================================="

while true; do
  # Check if there are any git modifications or untracked files
  if [ -n "$(git status --porcelain)" ]; then
    echo ""
    echo " Detected file changes at $(date '+%H:%M:%S'). Syncing to GitHub..."
    git add -A
    git commit -m "Auto-sync update at $(date '+%Y-%m-%d %H:%M:%S')" || true
    git push origin main && echo "✅ Successfully synced to GitHub!" || echo "⚠️ Push failed, retrying on next change..."
  fi
  sleep 3
done
