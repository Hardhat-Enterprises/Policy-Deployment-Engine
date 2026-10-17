resource "google_workstations_workstation_config_iam_binding" "non_compliant_example_1" {
  project                = "925810350503"
  location               = "us-central1"
  workstation_cluster_id = "workstation-cluster"
  workstation_config_id  = "non_compliant_example_1"
  role                   = "roles/viewer"
  members = [
    "allUsers"
  ]
}
