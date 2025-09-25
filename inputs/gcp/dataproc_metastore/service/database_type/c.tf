resource "google_dataproc_metastore_service" "c" {
  service_id = "metastore-srv"
  database_type = "MYSQL"
  project = 1


}