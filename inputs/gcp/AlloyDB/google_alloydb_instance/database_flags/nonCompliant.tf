resource "google_alloydb_instance" "non_compliant_example_1" {
  cluster       = "projects/test-project/locations/australia-southeast1/clusters/test-cluster"
  instance_id   = "test-alloydb-instance"
  instance_type = "PRIMARY"

  database_flags = {
    log_min_messages = "DEBUG"
  }
}