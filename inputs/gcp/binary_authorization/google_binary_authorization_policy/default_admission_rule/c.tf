resource "google_binary_authorization_policy" "c1" {
  project = "my-gcp-project"

  default_admission_rule {
    evaluation_mode  = "REQUIRE_ATTESTATION"
    enforcement_mode = "ENFORCED_BLOCK_AND_AUDIT_LOG"
  }

  description = "Compliant policy: requires attestations and enforces blocking with audit logs"
}
