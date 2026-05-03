# Non-compliant: No unique writer identity
resource "google_logging_project_sink" "nc1" {
  name        = "nc1"
  project     = "my-project"
  destination = "storage.googleapis.com/logs-bucket"
  filter      = "logName = \"projects/my-project/logs/cloudaudit.googleapis.com%2Factivity\""
}

# Non-compliant: Explicitly set to false
resource "google_logging_project_sink" "nc2" {
  name                   = "nc2"
  project                = "my-project"
  destination            = "pubsub.googleapis.com/projects/my-project/topics/logs"
  unique_writer_identity = false
  filter                 = "logName = \"projects/my-project/logs/cloudaudit.googleapis.com%2Factivity\""
}