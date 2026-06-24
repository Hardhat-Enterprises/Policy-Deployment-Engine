# NON-COMPLIANT: Region is outside of the Australian whitelist
resource "google_data_fusion_instance_iam_member" "nc" {
  project = "gcp-project-12345"
  region  = "us-central1"
  name    = "nc"
  role    = "roles/viewer"
  member  = "user:student@deakin.edu.au"
}