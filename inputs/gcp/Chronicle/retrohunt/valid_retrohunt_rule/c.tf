resource "google_chronicle_retrohunt" "retro-c" {
  project  = "fake-project"
  location = "us"
  instance = "retrohunt rule -c"
  rule     = "test-rule"
  process_interval {
    start_time = "2025-01-01T00:00:00Z"
    end_time   = "2025-01-01T01:00:00Z"
  }
}
