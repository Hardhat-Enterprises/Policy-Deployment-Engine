resource "google_dataproc_metastore_service" "c" {
  service_id = "metastore-srv"
  project = 1

  encryption_config {
    kms_key = "projects-example/australia-southeast2/dpm-ring/metastore-cmek/"
    
  }


}
