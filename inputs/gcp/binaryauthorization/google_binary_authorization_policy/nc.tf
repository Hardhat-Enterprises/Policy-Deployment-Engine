resource "google_binary_authorization_policy" "bad_policy" {
  project = "my-gcp-project"

  default_admission_rule {
    evaluation_mode  = "REQUIRE_ATTESTATION"
    enforcement_mode = "ENFORCED_BLOCK_AND_AUDIT_LOG"
    require_attestations_by = ["projects/my-gcp-project/attestors/test-attestor"]
  }

  # Bad: empty name_pattern (Terraform accepts, OPA will flag)
  admission_whitelist_patterns {
    name_pattern = ""
  }
}
