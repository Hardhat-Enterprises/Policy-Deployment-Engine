resource "google_chronicle_data_access_scope" "noncompliant_scope" {
  project             = "fake-test-project" 
  location            = "jaipur"
  instance            = "00000000-0000-0000-0000-000000000000"
  data_access_scope_id = "Invalid instance spotted -nc"  
  description         = "Noncompliant data access scope with invalid ID"

  allowed_data_access_labels {
    log_type = "GCP_CLOUDAUDIT"
  }
}
