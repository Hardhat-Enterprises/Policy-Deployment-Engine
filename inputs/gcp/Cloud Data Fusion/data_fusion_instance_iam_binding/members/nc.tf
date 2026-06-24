resource "google_data_fusion_instance_iam_binding" "nc" {
  project = "gcp-project-12345"
  region  = "australia-southeast1"
  name    = "nc"
  role    = "roles/viewer"

  members = [
    "user:student1@deakin.edu.au",
    "allUsers"
  ]
}