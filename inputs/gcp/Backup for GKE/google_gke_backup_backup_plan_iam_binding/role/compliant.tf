resource "google_gke_backup_backup_plan_iam_binding" "compliant_example_1" {
  name                = "c"
  location = "australia-southeast1"
  project  = "PDE"
  role     = "roles/gkebackup.backupViewer"
  
  members = [
    "user:security-auditor@example.com",
    "group:backup-viewers@example.com"
  ]
}

resource "google_gke_backup_backup_plan_iam_binding" "compliant_example_2" {
  name     = "c_owner_group"
  location = "australia-southeast1"
  project  = "PDE"
  role     = "roles/owner"
  
  members = [
    "group:admins@example.com"
  ]
}

resource "google_gke_backup_backup_plan_iam_binding" "compliant_example_3" {
  name                = "c"
  location = "australia-southeast1"
  project = "PDE"
  
  role = "roles/gkebackup.backupViewer"  # SECURE: Standard predefined role
  
  members = [
    "serviceAccount:monitor@fluent-coder-468700-h4.iam.gserviceaccount.com"
  ]
}

resource "google_gke_backup_backup_plan_iam_binding" "compliant_example_4" {
  name                = "c"
  location = "australia-southeast1"
  project = "PDE"
  
  role = "roles/gkebackup.backupViewer"
  
  members = [
    "serviceAccount:backup-sa@fluent-coder-468700-h4.iam.gserviceaccount.com",
    "group:backup-viewers@yourdomain.com"
  ]
}
