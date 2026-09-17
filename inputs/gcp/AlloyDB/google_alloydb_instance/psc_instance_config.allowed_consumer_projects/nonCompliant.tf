resource "google_alloydb_instance" "non_compliant_example_1" {
  cluster       = "projects/test-project/locations/australia-southeast1/clusters/test-cluster"
  instance_id   = "test-alloydb-instance"
  instance_type = "PRIMARY"

  psc_instance_config {
    allowed_consumer_projects = [
      "123456789012",
      "987654321098"
    ]
  }
}