resource "google_dataproc_metastore_service" "nc" {
  service_id = "_metastore-srv"
  project = 1

  encryption_config {
    kms_key = "projects-example/usa/dpm-ring/metastore-cmek/"
    
  }
}