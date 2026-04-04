# Compliant: Data Access logs enabled for all services (both READ and WRITE)
resource "google_project_iam_audit_config" "c_full" {
  project = "my-project"
  service = "allServices"

  audit_log_config {
    log_type = "ADMIN_READ"
  }
  audit_log_config {
    log_type = "DATA_READ"
  }
  audit_log_config {
    log_type = "DATA_WRITE"
  }
}

# Compliant: Data Access logs enabled for Cloud Storage
resource "google_project_iam_audit_config" "c_storage" {
  project = "my-project"
  service = "storage.googleapis.com"

  audit_log_config {
    log_type = "ADMIN_READ"
  }
  audit_log_config {
    log_type = "DATA_READ"
  }
  audit_log_config {
    log_type = "DATA_WRITE"
  }
}

# Compliant: Data Access logs enabled for BigQuery
resource "google_project_iam_audit_config" "c_bigquery" {
  project = "my-project"
  service = "bigquery.googleapis.com"

  audit_log_config {
    log_type = "ADMIN_READ"
  }
  audit_log_config {
    log_type = "DATA_READ"
  }
  audit_log_config {
    log_type = "DATA_WRITE"
  }
}