resource "google_alloydb_instance" "compliant_example_1" {
  cluster       = "projects/test-project/locations/australia-southeast1/clusters/test-cluster"
  instance_id   = "test-alloydb-instance"
  instance_type = "PRIMARY"

  gce_zone = "australia-southeast1-b"
}