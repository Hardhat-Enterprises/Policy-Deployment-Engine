resource "google_logging_project_sink" "compliant_example_1" {
  name        = "compliant_example_1"
  project     = "my-project"
  destination = "storage.googleapis.com/my-audit-bucket"

  unique_writer_identity = true
}
