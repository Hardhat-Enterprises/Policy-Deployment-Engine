resource "google_binary_authorization_policy" "compliant_example_1" {
  project = "compliant_example_1"

  default_admission_rule {
    evaluation_mode  = "REQUIRE_ATTESTATION"
    enforcement_mode = "ENFORCED_BLOCK_AND_AUDIT_LOG"

    require_attestations_by = [
      "projects/my-gcp-project/attestors/my-attestor"
    ]
  }

  description = "Compliant policy with at least one attestor defined"
}
