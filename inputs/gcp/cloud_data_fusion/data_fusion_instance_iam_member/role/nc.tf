resource "google_data_fusion_instance_iam_member" "nc" {
  project = "gcp-project-12345"
  region  = "australia-southeast1"
  name    = "nc"
  role    = "roles/owner"
  member  = "user:student@deakin.edu.au"
}