resource "google_workstations_workstation_cluster" "non_compliant_example_1" {
  project                = "925810350503"
  workstation_cluster_id = "non_compliant_example_1"
  network                = "nc"
  subnetwork             = "nc"
  location               = "us-east1"

  labels = {
    "label" = "key"
  }

  annotations = {
    label-one = "value-one"
  }
}

