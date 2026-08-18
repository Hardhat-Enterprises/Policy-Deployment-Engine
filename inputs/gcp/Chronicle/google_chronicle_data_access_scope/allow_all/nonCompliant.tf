resource "google_chronicle_data_access_scope" "non_compliant_example_1" {
  project              = "fake-test-project"
  location             = "australia-southeast1"
  instance             = "123e4567-e89b-12d3-a456-426614174000"
  data_access_scope_id = "non_compliant_example_1"
  description          = "Non-compliant scope with overly permissive access"
  allow_all            = true
}
