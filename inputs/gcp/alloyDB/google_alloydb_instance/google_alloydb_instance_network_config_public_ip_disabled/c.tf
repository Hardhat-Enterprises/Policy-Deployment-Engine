resource "google_alloydb_instance" "c" {
  cluster       = "projects/pde-demo/locations/us-central1/clusters/cluster-c"
  instance_id   = "inst-no-public-ip"
  instance_type = "PRIMARY"
  gce_zone      = "us-central1-a"

  network_config { enable_public_ip = false }
}
