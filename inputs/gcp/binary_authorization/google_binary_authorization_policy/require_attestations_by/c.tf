resource "google_binary_authorization_policy" "c1" {
  project = "my-gcp-project"

  default_admission_rule {
    evaluation_mode  = "REQUIRE_ATTESTATION"
    enforcement_mode = "ENFORCED_BLOCK_AND_AUDIT_LOG"

    require_attestations_by = [
      "projects/my-gcp-project/attestors/my-attestor"
    ]
  }

  description = "Compliant policy with at least one attestor defined"
}
