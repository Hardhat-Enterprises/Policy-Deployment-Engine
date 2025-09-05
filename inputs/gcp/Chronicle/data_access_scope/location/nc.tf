resource "google_chronicle_data_access_scope" "noncompliant_scope_location" {
  project              = "fake-test-project"
  location             = "fjhfgfhf"  # Invalid location
  instance             = "00000000-0000-0000-0000-000000000000"
  data_access_scope_id = "non-compliant location-nc"
  description          = "Non-compliant data access scope with invalid location"

  allowed_data_access_labels {
    log_type = "GCP_CLOUDAUDIT"
  }
}
