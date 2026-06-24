resource "google_data_fusion_instance_iam_binding" "c" {
  project = "hardhat-enterprises-123"
  region  = "australia-southeast1"
  name    = "c"
  role    = "roles/viewer"

  members = ["user:student@deakin.edu.au"]
}