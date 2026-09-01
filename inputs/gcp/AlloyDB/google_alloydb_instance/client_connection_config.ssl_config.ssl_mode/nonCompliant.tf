resource "google_alloydb_instance" "non_compliant_example_1" {
  cluster       = "projects/p/locations/us-central1/clusters/cluster-c"
  instance_id   = "non_compliant_example_1"
  instance_type = "PRIMARY"
  gce_zone      = "us-central1-a"

  client_connection_config {
    ssl_config {
      ssl_mode = "ALLOW_UNENCRYPTED_AND_ENCRYPTED"
    }
  }
}
