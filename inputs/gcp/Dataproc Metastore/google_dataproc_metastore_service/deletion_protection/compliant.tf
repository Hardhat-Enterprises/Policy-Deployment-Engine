resource "google_dataproc_metastore_service" "compliant_example_1" {
  service_id = "compliant_example_1"
  deletion_protection = true
  project = 1

}
