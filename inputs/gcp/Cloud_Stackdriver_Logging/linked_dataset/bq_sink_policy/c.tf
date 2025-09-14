resource "google_logging_project_sink" "c" {
  name        = "c"  # Standard naming
  project     = "gdce-dev"
  destination = "bigquery.googleapis.com/projects/gdce-dev/datasets/audit_logs"  # Approved dataset
  filter      = "resource.type=audited_resource AND severity>=INFO"  # Specific filter
  description = "Export audit logs to BigQuery for security analysis"  # Has description

  unique_writer_identity = true
}