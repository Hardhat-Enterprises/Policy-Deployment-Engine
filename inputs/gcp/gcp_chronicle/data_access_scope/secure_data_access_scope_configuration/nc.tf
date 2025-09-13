resource "google_chronicle_data_access_scope" "nc" {
  project              = "fake-test-project"
  location             = "australia-southeast1"
  instance             = "123e4567-e89b-12d3-a456-426614174000"
  data_access_scope_id = "nc"  
  description          = "Non-compliant scope with overly permissive access"
  allow_all = true
}
