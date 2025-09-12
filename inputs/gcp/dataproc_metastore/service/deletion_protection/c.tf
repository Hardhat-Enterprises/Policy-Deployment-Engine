resource "google_dataproc_metastore_service" "c" {
  service_id = "metastore-srv"
  deletion_protection = true
  project = 1


}
