resource "google_folder_iam_audit_config" "c" {
  folder  = "folders/1234567"
  service = "allServices"

  audit_log_config { log_type = "ADMIN_READ" }

  audit_log_config { log_type = "DATA_READ" }

  audit_log_config { log_type = "DATA_WRITE" }
}
