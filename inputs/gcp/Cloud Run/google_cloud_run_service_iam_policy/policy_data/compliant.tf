data "google_iam_policy" "c1" {
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
  service     = "compliant_example_1"
  policy_data = data.google_iam_policy.c1.policy_data
}

data "google_iam_policy" "c2" {
  binding {
    role = "roles/viewer"

    members = [
      "group:admins@example.com",
    ]
  }
}

resource "google_cloud_run_service_iam_policy" "compliant_example_2" {
  location    = "australia-southeast1"
  project     = "my-gcp-project"
  service     = "compliant_example_2"
  policy_data = data.google_iam_policy.c2.policy_data
}

data "google_iam_policy" "c3" {
  binding {
    role = "roles/viewer"

    members = [
      "serviceAccount:svc@my-gcp-project.iam.gserviceaccount.com",
    ]
  }
}

resource "google_cloud_run_service_iam_policy" "compliant_example_3" {
  location    = "australia-southeast1"
  project     = "my-gcp-project"
  service     = "compliant_example_3"
  policy_data = data.google_iam_policy.c3.policy_data
}
