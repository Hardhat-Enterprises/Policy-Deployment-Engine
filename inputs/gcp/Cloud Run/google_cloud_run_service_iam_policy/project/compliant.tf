data "google_iam_policy" "c" {
  binding {
    role = "roles/viewer"

    members = [
      "user:jane@example.com",
    ]
  }
}

resource "google_cloud_run_service_iam_policy" "compliant_example_1" {
  location    = "australia-southeast1"
  project     = "my-gcp-project"
  service = "compliant_example_1"
  policy_data = data.google_iam_policy.c.policy_data
}
