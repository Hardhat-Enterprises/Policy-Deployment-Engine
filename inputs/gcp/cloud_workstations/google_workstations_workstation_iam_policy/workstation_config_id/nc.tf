data "google_iam_policy" "nc" {
  binding {
    role = "roles/viewer"
    members = [
      "user:jane@example.com",
    ]
  }
}

resource "google_workstations_workstation_iam_policy" "nc" {
  project                = "925810350503"
  location               = "us-central1"
  workstation_cluster_id = "workstation-cluster"
  workstation_config_id  = "wrong-config"
  workstation_id         = "work-station"
  policy_data            = data.google_iam_policy.nc.policy_data
}