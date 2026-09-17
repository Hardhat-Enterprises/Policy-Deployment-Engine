resource "google_alloydb_instance" "non_compliant_example_1" {
  cluster       = "projects/test-project/locations/australia-southeast1/clusters/test-cluster"
  instance_id   = "test-alloydb-instance"
  instance_type = "PRIMARY"

  client_connection_config {
    require_connectors = false
  }
}