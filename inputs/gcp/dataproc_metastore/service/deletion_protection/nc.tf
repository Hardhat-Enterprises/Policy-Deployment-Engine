resource "google_dataproc_metastore_service" "nc" {
  service_id = "nc"
  deletion_protection = false
  project = 1

}