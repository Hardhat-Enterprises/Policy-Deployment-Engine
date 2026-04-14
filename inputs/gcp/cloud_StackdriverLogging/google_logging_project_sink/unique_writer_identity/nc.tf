# Non-compliant: No unique writer identity (uses default service account)
resource "google_logging_project_sink" "nc" {
  name        = "default-sink"
  project     = "my-project"
  destination = "storage.googleapis.com/logs-bucket"
  # unique_writer_identity omitted - defaults to false

  filter = "logName = \"projects/my-project/logs/cloudaudit.googleapis.com%2Factivity\""
}

# Non-compliant: Explicitly set to false
resource "google_logging_project_sink" "nc2" {
  name                   = "shared-sink"
  project                = "my-project"
  destination            = "pubsub.googleapis.com/projects/my-project/topics/logs"
  unique_writer_identity = false

  filter = "logName = \"projects/my-project/logs/cloudaudit.googleapis.com%2Factivity\""
}