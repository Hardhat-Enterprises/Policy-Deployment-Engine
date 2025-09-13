resource "google_chronicle_data_access_scope" "c" {
  project              = "fake-test-project"
  location             = "australia-southeast1" 
  instance             = "00000000-0000-0000-0000-000000000000"
  data_access_scope_id = "c"
  description          = "Compliant data access scope with valid location"
  allowed_data_access_labels {
    log_type = "GCP_CLOUDAUDIT"
  }
}
