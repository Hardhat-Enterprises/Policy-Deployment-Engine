resource "google_gke_backup_backup_plan_iam_binding" "nc" {
  project  = "fluent-coder-468700-h4"
  location = "australia-southeast1"
  name     = "nc"
  role     = "roles/gkebackup.admin"

  members = [
    "allUsers",
    "allAuthenticatedUsers"
  ]
}