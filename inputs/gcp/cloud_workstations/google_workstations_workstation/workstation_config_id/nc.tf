
resource "google_workstations_workstation" "nc" {
  project                = "925810350503"
  workstation_id         = "nc"
  workstation_config_id  = "wrong-config"
  workstation_cluster_id = "nc"
  location               = "us-central1"

  labels = {
    "label" = "key"
  }

  env = {
    name = "nc"
  }

  annotations = {
    label-one = "value-one"
  }
}