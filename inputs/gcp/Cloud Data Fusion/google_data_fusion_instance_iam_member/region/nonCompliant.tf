# NON-COMPLIANT: Region is outside of the Australian whitelist
resource "google_data_fusion_instance_iam_member" "non_compliant_example_1" {
  project = "gcp-project-12345"
  region  = "us-central1"
  name    = "non_compliant_example_1"
  role    = "roles/viewer"
  member  = "user:student@deakin.edu.au"
}
