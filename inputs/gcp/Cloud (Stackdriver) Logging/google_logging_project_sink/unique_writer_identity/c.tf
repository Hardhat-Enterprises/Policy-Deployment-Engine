# Compliant: Uses unique writer identity
resource "google_logging_project_sink" "c1" {
  name                   = "c1"
  project                = "my-project"
  destination            = "storage.googleapis.com/audit-logs-bucket"
  unique_writer_identity = true
  filter                 = "logName = \"projects/my-project/logs/cloudaudit.googleapis.com%2Factivity\""
}

# Compliant: Required for cross-project export
resource "google_logging_project_sink" "c2" {
  name                   = "c2"
  project                = "my-project"
  destination            = "bigquery.googleapis.com/projects/security-project/datasets/audit_logs"
  unique_writer_identity = true
  filter                 = "logName = \"projects/my-project/logs/cloudaudit.googleapis.com%2Factivity\""
}