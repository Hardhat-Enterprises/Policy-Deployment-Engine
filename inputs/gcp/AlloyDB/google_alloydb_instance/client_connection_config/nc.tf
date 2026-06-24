resource "google_alloydb_instance" "nc" {
  cluster       = "projects/p/locations/us-central1/clusters/cluster-nc"
  instance_id   = "nc"
  instance_type = "PRIMARY"
  gce_zone      = "us-central1-a"

  client_connection_config {
    ssl_config {
      ssl_mode = "ALLOW_UNENCRYPTED_AND_ENCRYPTED"
    }
  }
}
