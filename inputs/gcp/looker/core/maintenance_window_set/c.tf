resource "google_looker_instance" "ok" {
  name    = "ok"
  project = var.project
  maintenance_window {
    day_of_week = "SUNDAY"
    start_time {
      hours   = 2
      minutes = 0
      nanos   = 0
      seconds = 0
    }
  }
  oauth_config {
    client_id     = "test-client-id"
    client_secret = "test-client-secret"
  }
}
