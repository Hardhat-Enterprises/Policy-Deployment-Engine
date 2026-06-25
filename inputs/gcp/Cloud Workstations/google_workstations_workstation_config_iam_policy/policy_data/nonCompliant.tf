data "google_iam_policy" "nc" {
  binding {
    role = "roles/viewer"
    members = [
      "allUsers",
    ]
  }
}

resource "google_workstations_workstation_config_iam_policy" "non_compliant_example_1" {
  project                = "925810350503"
  location               = "us-central1"
  workstation_cluster_id = "workstation-cluster"
  workstation_config_id  = "non_compliant_example_1"
  policy_data            = data.google_iam_policy.nc.policy_data
}

data "google_iam_policy" "nc2" {
  binding {
    role = "roles/owner"
    members = [
      "user:jane@example.com",
    ]
  }
}

resource "google_workstations_workstation_config_iam_policy" "non_compliant_example_2" {
  project                = "925810350503"
  location               = "us-central1"
  workstation_cluster_id = "nc"
  workstation_config_id  = "non_compliant_example_2"
  policy_data            = data.google_iam_policy.nc2.policy_data
}
