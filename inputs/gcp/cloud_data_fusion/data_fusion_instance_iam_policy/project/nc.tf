data "google_iam_policy" "nc_admin" {
  binding {
    role    = "roles/viewer"
    members = ["user:jane@example.com"]
  }
}

resource "google_data_fusion_instance_iam_policy" "nc" {
  # This violates the Whitelist
  project     = "invalid-project-100" 
  region      = "australia-southeast1"
  name        = "nc"
  policy_data = data.google_iam_policy.nc_admin.policy_data
}