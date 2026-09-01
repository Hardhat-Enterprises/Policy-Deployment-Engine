resource "google_workstations_workstation" "non_compliant_example_1" {
  project                = "925810350503"
  workstation_id         = "non_compliant_example_1"
  workstation_config_id  = "c"
  workstation_cluster_id = "wrong-cluster"
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
