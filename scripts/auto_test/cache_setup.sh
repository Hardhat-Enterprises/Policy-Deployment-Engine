#!/usr/bin/env bash
set -euo pipefail

# Build a PROJECT-LOCAL Terraform provider cache for the OPA test suite.
#
# Everything lives under <repo>/.terraform-cache and nothing is written to
# $HOME/.terraform.d — so this never affects other Terraform projects on the
# machine (the previous version wrote a global ~/.terraform.d/terraform.rc).
#
# It creates a filesystem MIRROR of the single unified provider version. With the
# accompanying cli.tfrc (TF_CLI_CONFIG_FILE), every per-fixture `terraform init`
# is then fully OFFLINE and re-download-free: the provider binary is fetched once
# (here) and symlinked into each fixture's .terraform, so the on-disk footprint is
# ~one provider (~120MB), not hundreds of GB.
#
# Usage:  bash scripts/auto_test/cache_setup.sh
# Re-runnable; skips the download if the mirror is already populated.

TARGET_VERSION="${TARGET_VERSION:-7.37.0}"
PROVIDER="registry.terraform.io/hashicorp/google"

REPO_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/../.." && pwd)"
CACHE_ROOT="$REPO_ROOT/.terraform-cache"
MIRROR="$CACHE_ROOT/mirror"
CLI_TFRC="$CACHE_ROOT/cli.tfrc"
CANON_LOCK="$CACHE_ROOT/canonical.lock.hcl"
MIRROR_LEAF="$MIRROR/$PROVIDER/$TARGET_VERSION/linux_amd64"

mkdir -p "$MIRROR"

# 1) cli.tfrc — point Terraform at the local mirror for google; everything else
#    (there should be nothing else after eliminate_beta) may resolve directly.
cat > "$CLI_TFRC" <<EOF
provider_installation {
  filesystem_mirror {
    path    = "$MIRROR"
    include = ["$PROVIDER"]
  }
  direct {
    exclude = ["$PROVIDER"]
  }
}
EOF
echo "✅ wrote $CLI_TFRC"

# 2) Populate the mirror (once). Prefer the official command; fall back to seeding
#    from a provider binary already present in a local plugin cache (handy on hosts
#    where the registry is unreachable, e.g. IPv6-only egress is broken).
# We build an UNPACKED mirror (the bare provider binary under
# .../<version>/linux_amd64/) rather than the default packed (.zip) layout, because
# Terraform can then SYMLINK the binary into each fixture's .terraform instead of
# extracting a ~120MB copy per directory — far less disk churn across 1000+ runs.
if [ -f "$MIRROR_LEAF/terraform-provider-google" ]; then
  echo "✅ mirror already populated for google $TARGET_VERSION"
else
  mkdir -p "$MIRROR_LEAF"
  tmp="$(mktemp -d)"; tmpcache="$(mktemp -d)"
  cat > "$tmp/main.tf" <<EOF
terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "$TARGET_VERSION"
    }
  }
}
EOF
  # `terraform init` with a plugin cache unpacks the provider; copy that out.
  unpacked="$tmpcache/$PROVIDER/$TARGET_VERSION/linux_amd64/terraform-provider-google"
  if (cd "$tmp" && TF_PLUGIN_CACHE_DIR="$tmpcache" TF_DATA_DIR="$tmp/.tf" \
        terraform init -no-color >/dev/null 2>&1) \
     && [ -f "$unpacked" ]; then
    cp "$unpacked" "$MIRROR_LEAF/"
    echo "✅ mirrored (unpacked) google $TARGET_VERSION from the registry"
  else
    echo "⚠️  registry unreachable; trying to seed from a local plugin cache…"
    seeded=""
    for host in registry.terraform.io registry.opentofu.org; do
      src="$HOME/.terraform.d/plugin-cache/$host/hashicorp/google/$TARGET_VERSION/linux_amd64"
      if [ -f "$src/terraform-provider-google" ]; then
        cp "$src/terraform-provider-google" "$MIRROR_LEAF/"
        seeded="$src"; break
      fi
    done
    if [ -z "$seeded" ]; then
      echo "❌ could not populate mirror for google $TARGET_VERSION (no registry, no local copy)"; exit 1
    fi
    echo "✅ seeded mirror from $seeded"
  fi
  rm -rf "$tmp" "$tmpcache"
fi

# 3) Canonical lock (no constraint) pinning TARGET_VERSION with the mirror's
#    linux_amd64 h1 hash — distributed to every fixture by unify_provider_versions.py.
tmp="$(mktemp -d)"
cat > "$tmp/main.tf" <<'EOF'
terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
    }
  }
}
EOF
( cd "$tmp" \
  && TF_CLI_CONFIG_FILE="$CLI_TFRC" TF_DATA_DIR="$tmp/.tf" \
     terraform providers lock -fs-mirror="$MIRROR" -platform=linux_amd64 -no-color >/dev/null 2>&1 )
cp "$tmp/.terraform.lock.hcl" "$CANON_LOCK"
rm -rf "$tmp"
echo "✅ wrote $CANON_LOCK"

du -sh "$CACHE_ROOT"
echo "✅ project-local Terraform cache ready (no global ~/.terraform.d writes)."
