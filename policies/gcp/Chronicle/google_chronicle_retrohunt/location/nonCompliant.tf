resource "google_chronicle_retrohunt" "non_compliant_example_1" {
  project  = "fake-project"
  location = "italy"
  instance = "non_compliant_example_1"
  rule     = "test-rule"
  process_interval {
    start_time = "2025-01-01T00:00:00Z"
    end_time   = "2025-01-01T01:00:00Z"
  }
}
