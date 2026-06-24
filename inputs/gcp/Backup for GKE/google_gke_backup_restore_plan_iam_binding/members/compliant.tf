resource "google_gke_backup_restore_plan_iam_binding" "compliant_example_1" {
  name                = "c"
  location = "australia-southeast1"
  project = "PDE"
  
  role = "roles/gkebackup.restoreViewer"
  
  members = [
    "group:sre-team@yourdomain.com",  # SECURE: Company domain group
    "group:dr-team@yourdomain.com"    # SECURE: Company domain group
  ]
}

resource "google_gke_backup_restore_plan_iam_binding" "compliant_example_2" {
  name                = "c"
  location = "australia-southeast1"
  project = "PDE"
  
  role = "roles/gkebackup.restoreViewer"
  
  members = [
    "group:sre-team@yourdomain.com",  # SECURE: Specific group
    "group:incident-response@yourdomain.com"  # SECURE: Specific group
  ]
}

resource "google_gke_backup_restore_plan_iam_binding" "compliant_example_3" {
  name     = "rp-iam-c"
  location = "australia-southeast1"
  project  = "PDE"
  role     = "roles/gkebackup.restoreViewer"
  
  members = [
    "user:alice@example.com",
    "user:bob@example.com",
    "group:viewers@example.com"
  ]
}

resource "google_gke_backup_restore_plan_iam_binding" "compliant_example_4" {
  name                = "c"
  location = "australia-southeast1"
  project = "PDE"
  
  role = "roles/gkebackup.restoreViewer"
  
  members = [
    "user:john.doe@yourdomain.com",  # SECURE: Company domain
    "user:jane.admin@yourdomain.com"  # SECURE: Company domain
  ]
}

resource "google_gke_backup_restore_plan_iam_binding" "compliant_example_5" {
  name                = "c"
  location = "australia-southeast1"
  project = "PDE"
  
  role = "roles/gkebackup.restoreViewer"
  
  members = [
    "serviceAccount:dr-restore@fluent-coder-468700-h4.iam.gserviceaccount.com",
    "group:incident-response@yourdomain.com"
  ]
}

resource "google_gke_backup_restore_plan_iam_binding" "compliant_example_6" {
  name                = "c"
  location = "australia-southeast1"
  project = "PDE"
  
  role = "roles/gkebackup.restoreAdmin"
  
  members = [
    "serviceAccount:restore-automation@fluent-coder-468700-h4.iam.gserviceaccount.com",  # SECURE: Same project SA
    "serviceAccount:dr-restore@fluent-coder-468700-h4.iam.gserviceaccount.com"  # SECURE: Allowed project SA
  ]
}
