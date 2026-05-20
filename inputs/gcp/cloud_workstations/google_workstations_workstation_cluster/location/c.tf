resource "google_workstations_workstation_cluster" "c" {
  project                = "925810350503"
  workstation_cluster_id = "workstation-cluster"
  network                = "c"
  subnetwork             = "c"
  location               = "us-central1"

  labels = {
    "label" = "key"
  }

  annotations = {
    label-one = "value-one"
  }
}



