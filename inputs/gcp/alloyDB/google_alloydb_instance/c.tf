resource "google_alloydb_instance" "c" {
  cluster       = "projects/pde-demo/locations/us-central1/clusters/cluster-cbk-on"
  instance_id   = "inst-labeled"
  instance_type = "PRIMARY"
  gce_zone      = "us-central1-a"

  labels = {
    owner              = "db-team@example.com"
    data_classification = "confidential"
  }
}
