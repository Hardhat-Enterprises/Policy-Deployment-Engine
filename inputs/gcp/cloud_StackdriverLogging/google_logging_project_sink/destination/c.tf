resource "google_logging_project_sink" "c" {
  name        = "audit-log-sink"
  project     = "my-project"
  destination = "storage.googleapis.com/my-audit-bucket"
  
  unique_writer_identity = true
}