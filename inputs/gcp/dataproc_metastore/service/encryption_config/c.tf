# Describe your resource type here
# Keep "c" as the name to indicate that this resource and its attributes are compliant

resource "google_dataproc_metastore_service" "c" {
  service_id = "metastore-srv"
  project = 1

  encryption_config {
    kms_key = "projects-example/australia-southeast2/dpm-ring/metastore-cmek/"
    
  }


}
