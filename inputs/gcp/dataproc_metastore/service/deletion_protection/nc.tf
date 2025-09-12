resource "google_dataproc_metastore_service" "nc" {
  service_id = "_metastore-srv"
  deletion_protection = false
  project = 1

}