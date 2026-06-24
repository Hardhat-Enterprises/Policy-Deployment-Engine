resource "google_gke_backup_restore_plan_iam_binding" "c_g0" {
  name                = "c"
  location = "australia-southeast1"
  project  = "PDE"
  role     = "roles/gkebackup.restoreViewer"
  
  members = [
    "serviceAccount:restore-monitor@PDE.iam.gserviceaccount.com",
    "group:sre-readonly@yourdomain.com"
  ]
}

resource "google_gke_backup_restore_plan_iam_binding" "c_owner_group_g0" {
  name     = "c_owner_group"
  location = "australia-southeast1"
  project  = "PDE"
  role     = "roles/owner"
  
  members = [
    "group:admins@example.com"
  ]
}

resource "google_gke_backup_restore_plan_iam_binding" "c_g1" {
  name                = "c"
  location = "australia-southeast1"
  project = "PDE"
  
  role = "roles/gkebackup.restoreViewer"
  
  members = [
    "serviceAccount:restore-viewer@fluent-coder-468700-h4.iam.gserviceaccount.com"
  ]
}

resource "google_gke_backup_restore_plan_iam_binding" "c_g2" {
  name                = "c"
  location = "australia-southeast1"
  project = "PDE"
  
  role = "roles/gkebackup.viewer"  # SECURE: Read-only access
  
  members = [
    "serviceAccount:audit-sa@fluent-coder-468700-h4.iam.gserviceaccount.com"
  ]
}
