data "google_iam_policy" "c" {
  binding {
    role = "roles/viewer"
    members = [
      "user:jane@example.com",
    ]
  }
}

resource "google_workstations_workstation_config_iam_policy" "c_g0" {
  project                = "925810350503"
  location               = "us-central1"
  workstation_cluster_id = "workstation-cluster"
  workstation_config_id  = "workstation-config"
  policy_data            = data.google_iam_policy.c.policy_data
}

data "google_iam_policy" "c" {
  binding {
    role = "roles/viewer"
    members = [
      "user:jane@example.com",
    ]
  }
}

resource "google_workstations_workstation_config_iam_policy" "c_g1" {
  project                = "925810350503"
  location               = "us-central1"
  workstation_cluster_id = "c"
  workstation_config_id  = "c"
  policy_data            = data.google_iam_policy.c.policy_data
}
