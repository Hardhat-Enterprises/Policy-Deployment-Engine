resource "google_workstations_workstation_cluster" "nc" {
  project                = "925810350503"
  workstation_cluster_id = "wrong-cluster"
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



