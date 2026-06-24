data "google_iam_policy" "nc" {
  binding {
    role = "roles/viewer"

    members = [
      "allUsers",
    ]
  }
}

resource "google_cloud_run_service_iam_policy" "nc_g0" {
  location    = "australia-southeast1"
  project     = "my-gcp-project"
  service = "nc"
  policy_data = data.google_iam_policy.nc.policy_data
}

data "google_iam_policy" "nc" {
  binding {
    role = "roles/viewer"

    members = [
      "domain:example.com",
    ]
  }
}

resource "google_cloud_run_service_iam_policy" "nc_g1" {
  location    = "australia-southeast1"
  project     = "my-gcp-project"
  service = "nc"
  policy_data = data.google_iam_policy.nc.policy_data
}

data "google_iam_policy" "nc" {
  binding {
    role = "roles/run.admin"

    members = [
      "user:jane@example.com",
    ]
  }
}

resource "google_cloud_run_service_iam_policy" "nc_g2" {
  location    = "australia-southeast1"
  project     = "my-gcp-project"
  service = "nc"
  policy_data = data.google_iam_policy.nc.policy_data
}
