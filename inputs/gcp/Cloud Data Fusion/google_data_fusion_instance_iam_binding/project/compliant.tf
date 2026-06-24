resource "google_data_fusion_instance_iam_binding" "compliant_example_1" {
  project = "hardhat-enterprises-123"
  region  = "australia-southeast1"
  name    = "compliant_example_1"
  role    = "roles/viewer"

  members = ["user:student@deakin.edu.au"]
}
