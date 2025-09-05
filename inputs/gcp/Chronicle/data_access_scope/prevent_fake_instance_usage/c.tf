resource "google_chronicle_data_access_scope" "compliant_scope_id" {
  project            = "fake-test-project"
  location           = "us"
  instance           = "123e4567-e89b-12d3-a456-426614174000"
  data_access_scope_id = "Valid instance -c"
  description        = "Compliant data access scope with valid ID"

  allowed_data_access_labels {
    log_type = "GCP_CLOUDAUDIT"
  }
}
