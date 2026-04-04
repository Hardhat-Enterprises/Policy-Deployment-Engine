# Non-compliant: Only ADMIN_READ, missing DATA_READ and DATA_WRITE
resource "google_project_iam_audit_config" "nc_no_data" {
  project = "my-project"
  service = "allServices"

  audit_log_config {
    log_type = "ADMIN_READ"
  }
  # Missing DATA_READ and DATA_WRITE
}

# Non-compliant: Only DATA_WRITE but missing DATA_READ
resource "google_project_iam_audit_config" "nc_no_read" {
  project = "my-project"
  service = "cloudkms.googleapis.com"

  audit_log_config {
    log_type = "ADMIN_READ"
  }
  audit_log_config {
    log_type = "DATA_WRITE"
  }
  # Missing DATA_READ
}

# Non-compliant: Only DATA_READ but missing DATA_WRITE
resource "google_project_iam_audit_config" "nc_no_write" {
  project = "my-project"
  service = "compute.googleapis.com"

  audit_log_config {
    log_type = "ADMIN_READ"
  }
  audit_log_config {
    log_type = "DATA_READ"
  }
  # Missing DATA_WRITE
}