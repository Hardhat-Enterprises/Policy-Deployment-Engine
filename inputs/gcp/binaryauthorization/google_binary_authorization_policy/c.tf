resource "google_binary_authorization_policy" "good_policy" {
  project = "my-gcp-project"

  default_admission_rule {
    evaluation_mode  = "REQUIRE_ATTESTATION"
    enforcement_mode = "ENFORCED_BLOCK_AND_AUDIT_LOG"
    require_attestations_by = [
      "projects/my-gcp-project/attestors/test-attestor"
    ]
  }

  admission_whitelist_patterns {
    name_pattern = "gcr.io/my-project/*"
  }
}
