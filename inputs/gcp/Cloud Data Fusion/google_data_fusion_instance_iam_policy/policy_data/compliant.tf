data "google_iam_policy" "c_admin" {
  binding {
    role = "roles/viewer"
    members = [
      "user:student@deakin.edu.au",
    ]
  }
}

resource "google_data_fusion_instance_iam_policy" "compliant_example_1" {
  project     = "gcp-project-12345"
  region      = "australia-southeast1"
  name        = "compliant_example_1"
  policy_data = data.google_iam_policy.c_admin.policy_data
}
