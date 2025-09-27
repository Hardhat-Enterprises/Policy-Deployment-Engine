resource "google_gke_backup_backup_plan_iam_binding" "c" {
  project  = "fluent-coder-468700-h4"
  location = "australia-southeast1"
  name     = "c"
  role     = "roles/gkebackup.viewer"
  
  members = [
    "user:backup-viewer@yourcompany.com",
    "serviceAccount:monitoring-service@yourcompany.iam.gserviceaccount.com"
  ]
}