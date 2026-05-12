resource "google_data_fusion_instance_iam_binding" "nc" {
  project = "external-project-100"
  region  = "australia-southeast1"
  name    = "nc"
  role    = "roles/viewer"

  members = ["user:student@deakin.edu.au"]
}