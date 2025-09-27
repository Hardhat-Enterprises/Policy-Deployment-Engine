resource "google_gke_backup_restore_plan_iam_binding" "c" {
  project  = "fluent-coder-468700-h4"
  location = "australia-southeast1"
  name     = "c"
  role     = "roles/gkebackup.restoreViewer"
  
  members = [
    "user:restore-admin@yourcompany.com",
    "serviceAccount:restore-service@yourcompany.iam.gserviceaccount.com"
  ]
}