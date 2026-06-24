
resource "google_workstations_workstation" "c" {
  project                = "925810350503"
  workstation_id         = "work-station"
  workstation_config_id  = "c"
  workstation_cluster_id = "c"
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