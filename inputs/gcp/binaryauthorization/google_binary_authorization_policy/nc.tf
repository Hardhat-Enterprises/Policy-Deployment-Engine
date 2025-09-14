resource "google_binary_authorization_policy" "bad_policy" {
  project = "my-gcp-project"

  default_admission_rule {
    evaluation_mode  = "ALWAYS_ALLOW"   # Non-compliant: too permissive
    enforcement_mode = "DRYRUN"         # Non-compliant: does not block
    require_attestations_by = []        # Non-compliant: no attestors
  }

  admission_whitelist_patterns {
    name_pattern = ""  # Non-compliant: empty string
  }
}
