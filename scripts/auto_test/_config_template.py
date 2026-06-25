"""Canonical GA ``google`` provider config, shared by the auto_test maintenance
scripts (eliminate_beta.py, unify_provider_versions.py) so the template can't
drift between them. No version pin — the version is pinned by the committed
.terraform.lock.hcl (see unify_provider_versions.py / cache_setup.sh)."""

GOOGLE_CONFIG_TF = """##### DO NOT EDIT ######

terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
    }
  }
}

provider "google" {}
"""
