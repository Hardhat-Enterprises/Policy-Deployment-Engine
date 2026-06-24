resource "google_workstations_workstation_cluster" "nc" {
  project                = "1122334455"
  workstation_cluster_id = "nc"
  network                = "nc"
  subnetwork             = "nc"
  location               = "us-central1"

  labels = {
    "label" = "key"
  }

  annotations = {
    label-one = "value-one"
  }
}



