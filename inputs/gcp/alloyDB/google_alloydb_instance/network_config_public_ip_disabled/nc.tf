resource "google_alloydb_instance" "nc" {
  cluster       = "projects/pde-demo/locations/us-central1/clusters/cluster-nc"
  instance_id   = "nc"
  instance_type = "PRIMARY"
  gce_zone      = "us-east1-b"

  network_config { enable_public_ip = true }
}
