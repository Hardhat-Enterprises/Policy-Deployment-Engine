resource "google_workstations_workstation_config_iam_binding" "nc" {
  project                = "925810350503"
  location               = "us-central1"
  workstation_cluster_id = "workstation-cluster"
  workstation_config_id  = "workstation-config"
  role                   = "roles/owner"
  members = [
    "user:jane@example.com",
  ]
}