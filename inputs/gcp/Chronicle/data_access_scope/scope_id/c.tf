resource "google_chronicle_data_access_scope" "compliant_scope_id" {
  project            = "fake-test-project" # ← Added for test purposes
  location           = "us"
  instance           = "00000000-0000-0000-0000-000000000000"
  data_access_scope_id = "scope-compliant-01"
  description        = "Compliant data access scope with valid ID"

  allowed_data_access_labels {
    log_type = "GCP_CLOUDAUDIT"
  }
}
