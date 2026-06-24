resource "google_gke_backup_backup_plan_iam_binding" "non_compliant_example_1" {
  name     = "nc"
  location = "australia-southeast1"
  project  = "PDE"
  role     = "roles/owner" # Blocked because member is a user
  
  members = [
    "user:random-contractor@gmail.com"
  ]
}

resource "google_gke_backup_backup_plan_iam_binding" "non_compliant_example_2" {
  name = "nc"
  location = "australia-southeast1"
  project = "PDE"
  
  role = "organizations/12345/roles/super_admin"  # SECURITY RISK: Org-level custom role!
  
  members = [
    "user:contractor@gmail.com"
  ]
}

resource "google_gke_backup_backup_plan_iam_binding" "non_compliant_example_3" {
  name = "nc"
  location = "australia-southeast1"
  project = "PDE"
  
  role = "roles/gkebackup.backupAdmin"
  
  members = [
    "projectOwner:fluent-coder-468700-h4",  # SECURITY RISK: All project owners!
    "projectEditor:fluent-coder-468700-h4"  # SECURITY RISK: All project editors!
  ]
}
