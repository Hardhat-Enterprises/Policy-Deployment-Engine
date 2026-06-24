resource "google_binary_authorization_policy" "nc1_g0" {
  project = "nc1"

  default_admission_rule {
    evaluation_mode  = "ALWAYS_ALLOW"
    enforcement_mode = "DRYRUN_AUDIT_LOG_ONLY"
  }

  description = "Non-compliant policy: too permissive and does not enforce blocking"
}

resource "google_binary_authorization_policy" "nc1_g1" {
  project = "nc1"

  default_admission_rule {
    evaluation_mode  = "ALWAYS_ALLOW"
    enforcement_mode = "ENFORCED_BLOCK_AND_AUDIT_LOG"
  }

  admission_whitelist_patterns {
    name_pattern = ""
  }

  description = "Non-compliant policy with ALWAYS_ALLOW and empty whitelist"
}
