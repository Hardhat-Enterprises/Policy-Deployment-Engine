# Compliant: Uses unique writer identity
resource "google_logging_project_sink" "compliant_example_1" {
  name                   = "compliant_example_1"
  project                = "my-project"
  destination            = "storage.googleapis.com/audit-logs-bucket"
  unique_writer_identity = true
  filter                 = "logName = \"projects/my-project/logs/cloudaudit.googleapis.com%2Factivity\""
}

# Compliant: Required for cross-project export
resource "google_logging_project_sink" "compliant_example_2" {
  name                   = "compliant_example_2"
  project                = "my-project"
  destination            = "bigquery.googleapis.com/projects/security-project/datasets/audit_logs"
  unique_writer_identity = true
  filter                 = "logName = \"projects/my-project/logs/cloudaudit.googleapis.com%2Factivity\""
}
