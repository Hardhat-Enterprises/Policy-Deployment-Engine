data "google_iam_policy" "c" {
  binding {
    role = "roles/viewer"
    members = [
      "user:jane@example.com",
    ]
  }
}

resource "google_workstations_workstation_iam_policy" "compliant_example_1" {
  project                = "925810350503"
  location               = "us-central1"
  workstation_cluster_id = "workstation-cluster"
  workstation_config_id  = "workstation-config"
  workstation_id         = "work-station"
  policy_data            = data.google_iam_policy.c.policy_data
}
