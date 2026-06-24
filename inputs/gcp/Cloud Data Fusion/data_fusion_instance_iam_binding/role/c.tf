resource "google_data_fusion_instance_iam_binding" "c" {
  project = "gcp-project-12345"
  region  = "australia-southeast1"
  name    = "c"
  role    = "roles/viewer"

  members = [
    "user:student@deakin.edu.au"
  ]
}