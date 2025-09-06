resource "google_alloydb_instance" "nc" {
  cluster       = "projects/pde-demo/locations/us-central1/clusters/cluster-cbk-on"
  instance_id   = "inst-missing-labels"
  instance_type = "PRIMARY"
  gce_zone      = "us-east1-b"

  # labels missing / invalid on purpose
  labels = {
    owner = ""
  }
}
