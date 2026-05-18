# COMPLIANT: Region matches the whitelist
resource "google_data_fusion_instance_iam_member" "c" {
  project = "gcp-project-12345"
  region  = "australia-southeast1"
  name    = "c"
  role    = "roles/viewer"
  member  = "user:student@deakin.edu.au"
}