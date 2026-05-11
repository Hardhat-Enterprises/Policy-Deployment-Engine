resource "google_workstations_workstation_config_iam_member" "nc" {
  project                = "925810350503"
  location               = "us-central1"
  workstation_cluster_id = "workstation-cluster"
  workstation_config_id  = "nc"

  role   = "roles/editor"
  member = "user:jane@example.com"
}