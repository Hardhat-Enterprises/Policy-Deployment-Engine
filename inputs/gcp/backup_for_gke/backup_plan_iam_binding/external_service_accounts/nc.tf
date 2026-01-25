resource "google_gke_backup_backup_plan_iam_binding" "nc" {
  name = "nc"
  location = "australia-southeast1"
  project = "PDE"
  
  role = "roles/gkebackup.backupAdmin"
  
  members = [
    "serviceAccount:random-sa@external-project-12345.iam.gserviceaccount.com",  # SECURITY RISK: External SA!
    "serviceAccount:unknown@suspicious-proj.iam.gserviceaccount.com"  # SECURITY RISK: Unknown project!
  ]
}
