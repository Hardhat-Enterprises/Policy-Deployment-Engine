resource "google_chronicle_retrohunt" "compliant_retrohunt_id" {
  project    = "fake-test-project"  
  location   = "us"
  instance   = "00000000-0000-0000-0000-000000000000"
  rule       = "example-rule"
  retrohunt  = "123e4567-e89b-12d3-a456-426614174000"  # Approved UUID
  process_interval {
    start_time = "2025-01-01T00:00:00Z"
    end_time   = "2025-01-01T12:00:00Z"
  }
}

