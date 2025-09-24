resource "google_binary_authorization_policy" "nc1" {
  project = "my-insecure-project"

  admission_whitelist_patterns {
    name_pattern = ""
  }

  default_admission_rule {
    evaluation_mode  = "ALWAYS_ALLOW"
    enforcement_mode = "ENFORCED_BLOCK_AND_AUDIT_LOG"
  }
}
