#!/usr/bin/env bash
set -e

echo "🚀 Bootstrapping dotfiles..."

bash .scripts/packages.sh
bash .scripts/symlinks.sh
bash .scripts/fish.sh

echo "✅ Done! Restart your terminal."
