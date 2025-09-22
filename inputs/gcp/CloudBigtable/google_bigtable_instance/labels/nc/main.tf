resource "google_folder_iam_audit_config" "audit_config" {
  folder = "NC-folder-id"  # Replace with actual Folder ID for NC

  audit_config {
    log_type         = "ADMIN_READ"
    exempted_members = []
  }

  audit_config {
    log_type         = "DATA_READ"
    exempted_members = []
  }

  audit_config {
    log_type         = "DATA_WRITE"
    exempted_members = []
  }
}
