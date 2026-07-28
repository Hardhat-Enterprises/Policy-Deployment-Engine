data "google_iam_policy" "nc" {
  binding {
    role = "roles/owner"
    members = [
      "user:jane@example.com",
    ]
  }
}

resource "google_artifact_registry_repository_iam_policy" "non_compliant_example_1" {
  project     = "my-project"
  location    = "australia-southeast1"
  repository  = "nc"
  policy_data = data.google_iam_policy.nc.policy_data
}
