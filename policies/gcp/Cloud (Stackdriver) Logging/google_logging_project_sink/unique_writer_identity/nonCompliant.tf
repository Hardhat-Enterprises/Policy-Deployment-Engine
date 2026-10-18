# Non-compliant: No unique writer identity (explicitly false)
resource "google_logging_project_sink" "non_compliant_example_1" {
  name                   = "non_compliant_example_1"
  project                = "my-project"
  destination            = "storage.googleapis.com/audit-logs-bucket"
  unique_writer_identity = false
  filter                 = "logName = \"projects/my-project/logs/cloudaudit.googleapis.com%2Factivity\""
}

# Non-compliant: Explicitly set to false
resource "google_logging_project_sink" "non_compliant_example_2" {
  name                   = "non_compliant_example_2"
  project                = "my-project"
  destination            = "bigquery.googleapis.com/projects/security-project/datasets/audit_logs"
  unique_writer_identity = false
  filter                 = "logName = \"projects/my-project/logs/cloudaudit.googleapis.com%2Factivity\""
}
