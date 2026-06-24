resource "google_gke_backup_restore_plan_iam_binding" "non_compliant_example_1" {
  name = "nc"
  location = "australia-southeast1"
  project = "PDE"
  
  role = "roles/gkebackup.restoreAdmin"
  
  members = [
    "group:consultants@external-contractors.com",  # SECURITY RISK: External domain!
    "group:partners@partner-collab.org"           # SECURITY RISK: Partner domain!
  ]
}

resource "google_gke_backup_restore_plan_iam_binding" "non_compliant_example_2" {
  name = "nc"
  location = "australia-southeast1"
  project = "PDE"
  
  role = "roles/gkebackup.restoreAdmin"
  
  members = [
    "user:hacker@gmail.com"
  ]
}

resource "google_gke_backup_restore_plan_iam_binding" "non_compliant_example_3" {
  name     = "rp-iam-nc"
  location = "australia-southeast1"
  project  = "PDE"
  role     = "roles/gkebackup.restoreViewer"
  
  members = [
    "user:user1@example.com",
    "user:user2@example.com",
    "user:user3@example.com",
    "user:user4@example.com",
    "user:user5@example.com",
    "user:user6@example.com",
    "user:user7@example.com",
    "user:user8@example.com",
    "user:user9@example.com",
    "user:user10@example.com",
    "user:user11@example.com" # 11 members, exceeding limit of 10
  ]
}

resource "google_gke_backup_restore_plan_iam_binding" "non_compliant_example_4" {
  name = "nc"
  location = "australia-southeast1"
  project = "PDE"
  
  role = "roles/gkebackup.restoreAdmin"
  
  members = [
    "user:johndoe123@gmail.com",  # SECURITY RISK: Personal Gmail!
    "user:contractor@hotmail.com",  # SECURITY RISK: Personal email!
    "user:admin@yahoo.com"  # SECURITY RISK: Personal email!
  ]
}

resource "google_gke_backup_restore_plan_iam_binding" "non_compliant_example_5" {
  name = "nc"
  location = "australia-southeast1"
  project = "PDE"
  
  role = "roles/gkebackup.restoreAdmin"
  
  members = [
    "allUsers",  # CRITICAL SECURITY RISK: Public restore access!
    "allAuthenticatedUsers"  # SECURITY RISK: Any Google account can restore!
  ]
}

resource "google_gke_backup_restore_plan_iam_binding" "non_compliant_example_6" {
  name = "nc"
  location = "australia-southeast1"
  project = "PDE"
  
  role = "roles/gkebackup.restoreAdmin"
  
  members = [
    "serviceAccount:unknown-sa@random-project-12345.iam.gserviceaccount.com",  # SECURITY RISK: Unknown project!
    "serviceAccount:external@suspicious-org.iam.gserviceaccount.com"  # SECURITY RISK: External SA!
  ]
}
