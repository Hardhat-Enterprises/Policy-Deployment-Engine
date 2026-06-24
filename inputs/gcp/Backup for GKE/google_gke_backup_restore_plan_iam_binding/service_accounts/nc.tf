resource "google_gke_backup_restore_plan_iam_binding" "nc" {
  name = "nc"
  location = "australia-southeast1"
  project = "PDE"
  
  role = "roles/gkebackup.restoreAdmin"
  
  members = [
    "serviceAccount:unknown-sa@random-project-12345.iam.gserviceaccount.com",  # SECURITY RISK: Unknown project!
    "serviceAccount:external@suspicious-org.iam.gserviceaccount.com"  # SECURITY RISK: External SA!
  ]
}
