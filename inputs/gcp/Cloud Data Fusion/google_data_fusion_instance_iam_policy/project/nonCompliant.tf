data "google_iam_policy" "nc_admin" {
  binding {
    role    = "roles/viewer"
    members = ["user:jane@example.com"]
  }
}

resource "google_data_fusion_instance_iam_policy" "non_compliant_example_1" {
  project     = "invalid-project-100" 
  region      = "australia-southeast1"
  name        = "non_compliant_example_1"
  policy_data = data.google_iam_policy.nc_admin.policy_data
}
