resource "google_alloydb_instance" "compliant_example_1" {
  cluster       = "projects/test-project/locations/australia-southeast1/clusters/test-cluster"
  instance_id   = "test-instance"
  instance_type = "PRIMARY"

  database_flags = {
    "alloydb.iam_authentication" = "on"
  }
}