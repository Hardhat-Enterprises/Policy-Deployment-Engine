#!/usr/bin/env bash
set -euo pipefail

# Default cache directory
CACHE_DIR="${1:-$HOME/.terraform.d/plugin-cache}"

# Ensure cache directory exists
mkdir -p "$CACHE_DIR"

# Create terraform.rc configuration
CONFIG_CONTENT=$(cat <<EOF
plugin_cache_dir = "$CACHE_DIR"
EOF
)

# Write to user-level config (for most environments)
mkdir -p "$HOME/.terraform.d"
echo "$CONFIG_CONTENT" > "$HOME/.terraform.d/terraform.rc"

# Also write to working directory as .terraformrc (used by Terraform in CI/CD sometimes)
echo "$CONFIG_CONTENT" > .terraformrc

echo "✅ Terraform plugin cache configuration written."