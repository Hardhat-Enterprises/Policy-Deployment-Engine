resource "google_dataproc_metastore_service" "non_compliant_example_1" {
  service_id = "non_compliant_example_1"
  database_type = "SPANNER" #not a compliant database type
  project = 1

}
