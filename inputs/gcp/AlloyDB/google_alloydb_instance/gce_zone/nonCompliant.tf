resource "google_alloydb_instance" "non_compliant_example_1" {
  cluster       = "projects/test-project/locations/australia-southeast1/clusters/test-cluster"
  instance_id   = "noncompliant-alloydb-instance"
  instance_type = "PRIMARY"

  gce_zone = "us-central1-a"
}