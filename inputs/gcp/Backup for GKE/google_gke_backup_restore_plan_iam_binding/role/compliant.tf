resource "google_gke_backup_restore_plan_iam_binding" "compliant_example_1" {
  name                = "c"
  location = "australia-southeast1"
  project  = "PDE"
  role     = "roles/gkebackup.restoreViewer"
  
  members = [
    "serviceAccount:restore-monitor@PDE.iam.gserviceaccount.com",
    "group:sre-readonly@yourdomain.com"
  ]
}

resource "google_gke_backup_restore_plan_iam_binding" "compliant_example_2" {
  name     = "c_owner_group"
  location = "australia-southeast1"
  project  = "PDE"
  role     = "roles/owner"
  
  members = [
    "group:admins@example.com"
  ]
}

resource "google_gke_backup_restore_plan_iam_binding" "compliant_example_3" {
  name                = "c"
  location = "australia-southeast1"
  project = "PDE"
  
  role = "roles/gkebackup.restoreViewer"
  
  members = [
    "serviceAccount:restore-viewer@fluent-coder-468700-h4.iam.gserviceaccount.com"
  ]
}

resource "google_gke_backup_restore_plan_iam_binding" "compliant_example_4" {
  name                = "c"
  location = "australia-southeast1"
  project = "PDE"
  
  role = "roles/gkebackup.viewer"  # SECURE: Read-only access
  
  members = [
    "serviceAccount:audit-sa@fluent-coder-468700-h4.iam.gserviceaccount.com"
  ]
}
