resource "google_workstations_workstation" "compliant_example_1" {
  project                = "925810350503"
  workstation_id         = "compliant_example_1"
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
