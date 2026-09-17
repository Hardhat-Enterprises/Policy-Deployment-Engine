resource "google_alloydb_instance" "compliant_example_1" {
  cluster      = "projects/test-project/locations/australia-southeast1/clusters/test-cluster"
  instance_id  = "compliant-alloydb-instance"
  instance_type = "PRIMARY"

  database_flags = {
    log_min_messages = "WARNING"
  }
}