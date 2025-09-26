resource "google_binary_authorization_policy" "nc1" {
  project = "nc1"

  global_policy_evaluation_mode = "ENABLE"

  default_admission_rule {
    evaluation_mode  = "REQUIRE_ATTESTATION"
    enforcement_mode = "DRYRUN_AUDIT_LOG_ONLY" # Logs only, non-compliant
  }
}
