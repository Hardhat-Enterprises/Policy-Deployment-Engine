resource "google_workstations_workstation_cluster" "compliant_example_1" {
  project                = "925810350503"
  workstation_cluster_id = "compliant_example_1"
  network                = "work-station"
  subnetwork             = "c"
  location               = "us-central1"

  labels = {
    "label" = "key"
  }

  annotations = {
    label-one = "value-one"
  }
}

