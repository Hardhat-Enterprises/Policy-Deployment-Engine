resource "google_chronicle_data_access_scope" "c" {
  project              = "fake-test-project"
  location             = "australia-southeast1"
  instance             = "123e4567-e89b-12d3-a456-426614174000"
  data_access_scope_id = "c"
  description          = "Compliant data access scope with valid ID"

  allowed_data_access_labels {
    log_type = "GCP_CLOUDAUDIT"
  }
  allow_all = false
}
