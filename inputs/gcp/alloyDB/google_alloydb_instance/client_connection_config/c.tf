resource "google_alloydb_instance" "c" {
  cluster       = "projects/p/locations/us-central1/clusters/cluster-c"
  instance_id   = "inst-ssl-on"
  instance_type = "PRIMARY"
  gce_zone      = "us-central1-a"

  client_connection_config {
    ssl_config {
      ssl_mode = "ENCRYPTED_ONLY"
    }
    # require_connectors = true  # <- optional, enable if you want to enforce connectors
  }
}
