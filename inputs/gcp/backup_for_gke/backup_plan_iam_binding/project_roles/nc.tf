resource "google_gke_backup_backup_plan_iam_binding" "nc" {
  name     = "nc"
  location = "australia-southeast1"
  project  = "PDE"

  role = "roles/gkebackup.backupAdmin"

  members = [
    "projectOwner:fluent-coder-468700-h4", # SECURITY RISK: All project owners!
    "projectEditor:fluent-coder-468700-h4" # SECURITY RISK: All project editors!
  ]
}
