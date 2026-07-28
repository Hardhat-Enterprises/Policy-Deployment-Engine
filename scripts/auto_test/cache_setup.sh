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

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
# Single source of truth for the provider version, shared with auto_test.py.
TARGET_VERSION="${TARGET_VERSION:-$(cat "$SCRIPT_DIR/provider_version.txt")}"
PROVIDER="registry.terraform.io/hashicorp/google"

REPO_ROOT="$(cd "$SCRIPT_DIR/../.." && pwd)"
CACHE_ROOT="$REPO_ROOT/.terraform-cache"
MIRROR="$CACHE_ROOT/mirror"
CLI_TFRC="$CACHE_ROOT/cli.tfrc"
CANON_LOCK="$CACHE_ROOT/canonical.lock.hcl"

# Detect the host platform so the mirror matches the terraform binary that
# will consume it (linux/darwin/windows, amd64/arm64) instead of assuming
# linux_amd64 (which breaks native Windows and Apple Silicon hosts).
case "$(uname -s)" in
  Linux*)               TF_OS=linux ;;
  Darwin*)              TF_OS=darwin ;;
  MINGW*|MSYS*|CYGWIN*) TF_OS=windows ;;
  *) echo "❌ unsupported OS: $(uname -s)"; exit 1 ;;
esac
case "$(uname -m)" in
  x86_64|amd64)  TF_ARCH=amd64 ;;
  arm64|aarch64) TF_ARCH=arm64 ;;
  *) echo "❌ unsupported arch: $(uname -m)"; exit 1 ;;
esac
PLATFORM="${TF_OS}_${TF_ARCH}"
MIRROR_LEAF="$MIRROR/$PROVIDER/$TARGET_VERSION/$PLATFORM"

# On Git Bash/MSYS the mirror path is /c/... which the native Windows
# terraform.exe cannot read from a config file — convert to C:/... form.
if [ "$TF_OS" = windows ] && command -v cygpath >/dev/null 2>&1; then
  MIRROR_CFG="$(cygpath -m "$MIRROR")"
else
  MIRROR_CFG="$MIRROR"
fi

# The provider binary keeps its versioned name in plugin caches and mirrors
# (e.g. terraform-provider-google_v7.37.0_x5[.exe]) — always match by glob.
have_provider() { compgen -G "$1/terraform-provider-google*" >/dev/null; }

mkdir -p "$MIRROR"

# 1) cli.tfrc — point Terraform at the local mirror for google; everything else
#    (there should be nothing else — fixtures use only GA google) may resolve directly.
cat > "$CLI_TFRC" <<EOF
provider_installation {
  filesystem_mirror {
    path    = "$MIRROR_CFG"
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
# .../<version>/<platform>/) rather than the default packed (.zip) layout, because
# Terraform can then SYMLINK the binary into each fixture's .terraform instead of
# extracting a ~120MB copy per directory — far less disk churn across 1000+ runs.
if have_provider "$MIRROR_LEAF"; then
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
  # TF_PLUGIN_CACHE_MAY_BREAK_DEPENDENCY_LOCK_FILE=1 is required on
  # Terraform >= 1.4, which otherwise refuses to populate a plugin cache
  # for providers not already in a lock file (fresh init has none).
  unpacked_dir="$tmpcache/$PROVIDER/$TARGET_VERSION/$PLATFORM"
  if (cd "$tmp" && TF_PLUGIN_CACHE_DIR="$tmpcache" TF_DATA_DIR="$tmp/.tf" \
        TF_PLUGIN_CACHE_MAY_BREAK_DEPENDENCY_LOCK_FILE=1 \
        terraform init -no-color >/dev/null 2>&1) \
     && have_provider "$unpacked_dir"; then
    cp "$unpacked_dir"/terraform-provider-google* "$MIRROR_LEAF/"
    echo "✅ mirrored (unpacked) google $TARGET_VERSION from the registry"
  else
    echo "⚠️  registry unreachable; trying to seed from a local plugin cache…"
    seeded=""
    for host in registry.terraform.io registry.opentofu.org; do
      src="$HOME/.terraform.d/plugin-cache/$host/hashicorp/google/$TARGET_VERSION/$PLATFORM"
      if have_provider "$src"; then
        cp "$src"/terraform-provider-google* "$MIRROR_LEAF/"
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
#    host-platform h1 hash. Per-fixture `terraform init` regenerates each fixture's
#    .terraform.lock.hcl from the mirror (locks are gitignored, not committed).
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
lock_log="$tmp/lock.log"
if ! ( cd "$tmp" \
       && TF_CLI_CONFIG_FILE="$CLI_TFRC" TF_DATA_DIR="$tmp/.tf" \
          terraform providers lock -fs-mirror="$MIRROR_CFG" -platform="$PLATFORM" -no-color ) \
       >"$lock_log" 2>&1 \
   || [ ! -f "$tmp/.terraform.lock.hcl" ]; then
  echo "❌ 'terraform providers lock' failed; cannot write $CANON_LOCK:"
  cat "$lock_log"
  rm -rf "$tmp"
  exit 1
fi
cp "$tmp/.terraform.lock.hcl" "$CANON_LOCK"
rm -rf "$tmp"
echo "✅ wrote $CANON_LOCK"

du -sh "$CACHE_ROOT"
echo "✅ project-local Terraform cache ready (no global ~/.terraform.d writes)."
