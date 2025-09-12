resource "google_chronicle_retrohunt" "nc" {
  project  = "fake-project"
  location = "australia-southeast1"
  instance = "nc"
  rule     = ""   #empty rule
  process_interval {
    start_time = "2025-01-01T00:00:00Z"
    end_time   = "2025-01-01T01:00:00Z"
  }
}
