resource "google_workstations_workstation_cluster" "nc" {
  project                = "925810350503"
  workstation_cluster_id = "nc"
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



