resource "google_dataproc_metastore_service" "compliant_example_1" {
  service_id = "compliant_example_1"
  project = 1

  encryption_config {
    kms_key = "projects-example/australia-southeast2/dpm-ring/metastore-cmek/"
    
  }

}
