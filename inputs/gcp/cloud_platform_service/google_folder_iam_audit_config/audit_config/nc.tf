resource "google_folder_iam_audit_config" "nc1" {
  folder  = "folders-A/09876"
  service = "allServices"

  audit_log_config {
    log_type = "ADMIN_READ"
    exempted_members = ["user:admin@example.com"] # ❌ exemptions not allowed
  }
}

resource "google_folder_iam_audit_config" "nc2" {
  folder  = "folders-B/87772"
  service = "allServices"

  audit_log_config {
    log_type = "DATA_READ"
    exempted_members = [] # ❌ exemptions not allowed
  }
}
