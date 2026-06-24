resource "google_chronicle_retrohunt" "compliant_example_1" {
  project  = "fake-project"
  location = "australia-southeast1"
  instance = "compliant_example_1"
  rule     = "test-rule"
  process_interval {
    start_time = "2025-01-01T00:00:00Z"
    end_time   = "2025-01-01T01:00:00Z"
  }
}
