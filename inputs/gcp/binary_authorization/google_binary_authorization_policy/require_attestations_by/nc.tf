resource "google_binary_authorization_policy" "nc1" {
  project = "my-gcp-project"

  default_admission_rule {
    evaluation_mode  = "REQUIRE_ATTESTATION"
    enforcement_mode = "ENFORCED_BLOCK_AND_AUDIT_LOG"

    require_attestations_by = []
  }

  description = "Non-compliant policy with no attestors defined"
}
