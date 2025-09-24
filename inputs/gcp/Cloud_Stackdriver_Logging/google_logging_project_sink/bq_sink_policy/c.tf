resource "google_logging_project_sink" "c" {
  name        = "c"  
  project     = "gdce-dev"
  destination = "bigquery.googleapis.com/projects/gdce-dev/datasets/audit_logs"  
  filter      = "resource.type=audited_resource AND severity>=INFO"  
  description = "Export audit logs to BigQuery for security analysis"  

  unique_writer_identity = true
}