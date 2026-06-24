resource "google_gke_backup_restore_plan_iam_binding" "non_compliant_example_1" {
  name = "nc"
  location = "australia-southeast1"
  project  = "PDE"
  role     = "roles/owner"
  
  members = [
    "user:contractor@external.com"
  ]
}

resource "google_gke_backup_restore_plan_iam_binding" "non_compliant_example_2" {
  name = "nc"
  location = "australia-southeast1"
  project = "PDE"
  
  role = "roles/gkebackup.restoreAdmin"
  
  members = [
    "projectOwner:fluent-coder-468700-h4",  # SECURITY RISK: All project owners!
    "projectEditor:fluent-coder-468700-h4",  # SECURITY RISK: All project editors!
    "projectViewer:fluent-coder-468700-h4"  # SECURITY RISK: All project viewers!
  ]
}

resource "google_gke_backup_restore_plan_iam_binding" "non_compliant_example_3" {
  name = "nc"
  location = "australia-southeast1"
  project = "PDE"
  
  role = "roles/container.clusterAdmin"  # SECURITY RISK: Full cluster admin for restore!
  
  members = [
    "user:contractor@gmail.com"
  ]
}
