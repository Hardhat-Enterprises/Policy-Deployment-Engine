resource "google_dataproc_metastore_service" "non_compliant_example_1" {
  service_id = "non_compliant_example_1"
  deletion_protection = false
  project = 1

}
