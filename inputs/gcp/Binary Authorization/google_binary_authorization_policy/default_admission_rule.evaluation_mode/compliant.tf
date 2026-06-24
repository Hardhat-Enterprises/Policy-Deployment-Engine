resource "google_binary_authorization_policy" "compliant_example_1" {
  project = "c1"

  default_admission_rule {
    evaluation_mode  = "REQUIRE_ATTESTATION"
    enforcement_mode = "ENFORCED_BLOCK_AND_AUDIT_LOG"
  }

  description = "Compliant policy: requires attestations and enforces blocking with audit logs"
}

resource "google_binary_authorization_policy" "compliant_example_2" {
  project = "c1"

  default_admission_rule {
    evaluation_mode  = "REQUIRE_ATTESTATION"
    enforcement_mode = "ENFORCED_BLOCK_AND_AUDIT_LOG"
  }

  admission_whitelist_patterns {
    name_pattern = "gcr.io/my-project/trusted-image:*"
  }

  description = "Compliant policy with REQUIRE_ATTESTATION and non-empty whitelist"
}
