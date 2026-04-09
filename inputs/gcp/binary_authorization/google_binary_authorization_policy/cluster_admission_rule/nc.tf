resource "google_binary_authorization_policy" "nc1" {
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
