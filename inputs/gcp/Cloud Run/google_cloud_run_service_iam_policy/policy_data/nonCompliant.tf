data "google_iam_policy" "nc1" {
  binding {
    role = "roles/viewer"

    members = [
      "allUsers",
    ]
  }
}

resource "google_cloud_run_service_iam_policy" "non_compliant_example_1" {
  location    = "australia-southeast1"
  project     = "my-gcp-project"
  service     = "non_compliant_example_1"
  policy_data = data.google_iam_policy.nc1.policy_data
}

data "google_iam_policy" "nc2" {
  binding {
    role = "roles/viewer"

    members = [
      "domain:example.com",
    ]
  }
}

resource "google_cloud_run_service_iam_policy" "non_compliant_example_2" {
  location    = "australia-southeast1"
  project     = "my-gcp-project"
  service     = "non_compliant_example_2"
  policy_data = data.google_iam_policy.nc2.policy_data
}

data "google_iam_policy" "nc3" {
  binding {
    role = "roles/run.admin"

    members = [
      "user:jane@example.com",
    ]
  }
}

resource "google_cloud_run_service_iam_policy" "non_compliant_example_3" {
  location    = "australia-southeast1"
  project     = "my-gcp-project"
  service     = "non_compliant_example_3"
  policy_data = data.google_iam_policy.nc3.policy_data
}
