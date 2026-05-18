
resource "google_workstations_workstation" "c" {
  project                = "925810350503"
  workstation_id         = "c"
  workstation_config_id  = "c"
  workstation_cluster_id = "workstation-cluster"
  location               = "us-central1"

  labels = {
    "label" = "key"
  }

  env = {
    name = "c"
  }

  annotations = {
    label-one = "value-one"
  }
}