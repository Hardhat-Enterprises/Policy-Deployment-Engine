resource "google_binary_authorization_policy" "nc" {
  project = "my-gcp-project"

  default_admission_rule {
    evaluation_mode  = "ALWAYS_ALLOW"
    enforcement_mode = "DRYRUN_AUDIT_LOG_ONLY"
  }

  description = "Non-compliant policy: too permissive and does not enforce blocking"
}
