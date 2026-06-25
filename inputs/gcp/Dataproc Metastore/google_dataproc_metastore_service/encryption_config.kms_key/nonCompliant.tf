resource "google_dataproc_metastore_service" "non_compliant_example_1" {
  service_id = "non_compliant_example_1"
  project = 1

  encryption_config {
    kms_key = "projects-example/usa/dpm-ring/metastore-cmek/"
    
  }
}
