resource "google_data_fusion_instance_iam_binding" "nc" {
  project = "gcp-project-12345"
  region  = "australia-southeast1"
  name    = "nc"
  role    = "roles/editor"

  members = [
    "user:student@deakin.edu.au"
  ]
}