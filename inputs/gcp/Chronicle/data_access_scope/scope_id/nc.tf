resource "google_chronicle_data_access_scope" "noncompliant_scope" {
  project             = "fake-test-project" # ← Added for test purposes
  location            = "jaipur"
  instance            = "00000000-0000-0000-0000-000000000000"
  data_access_scope_id = "1Invalid-Scope_ID!"  # Non-compliant: starts with digit, uppercase, underscore, exclamation mark
  description         = "Noncompliant data access scope with invalid ID"

  allowed_data_access_labels {
    log_type = "GCP_CLOUDAUDIT"
  }
}
