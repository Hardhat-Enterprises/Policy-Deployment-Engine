data "google_iam_policy" "nc_admin" {
  binding {
    role = "roles/viewer"
    members = [
      "allAuthenticatedUsers",
    ]
  }
}

resource "google_data_fusion_instance_iam_policy" "nc" {
  project     = "gcp-project-12345"
  region      = "australia-southeast1"
  name        = "nc"
  policy_data = data.google_iam_policy.nc_admin.policy_data
}