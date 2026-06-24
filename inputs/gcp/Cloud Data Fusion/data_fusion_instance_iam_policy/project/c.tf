data "google_iam_policy" "c_admin" {
  binding {
    role    = "roles/viewer"
    members = ["user:student@deakin.edu.au"]
  }
}

resource "google_data_fusion_instance_iam_policy" "c" {
  project     = "hardhat-enterprises-123"
  region      = "australia-southeast1"
  name        = "c"
  policy_data = data.google_iam_policy.c_admin.policy_data
}