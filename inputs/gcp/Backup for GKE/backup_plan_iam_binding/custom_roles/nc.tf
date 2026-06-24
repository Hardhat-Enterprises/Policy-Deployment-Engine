resource "google_gke_backup_backup_plan_iam_binding" "nc" {
  name = "nc"
  location = "australia-southeast1"
  project = "PDE"
  
  role = "organizations/12345/roles/super_admin"  # SECURITY RISK: Org-level custom role!
  
  members = [
    "user:contractor@gmail.com"
  ]
}
