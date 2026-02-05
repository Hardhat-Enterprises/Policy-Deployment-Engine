resource "google_dataproc_metastore_service" "nc" {
  service_id = "nc"
  database_type = "SPANNER" #not a compliant database type
  project = 1


}