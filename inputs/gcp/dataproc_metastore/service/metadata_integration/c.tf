resource "google_dataproc_metastore_service" "c" {
  service_id = "metastore-srv"
  project = 1

  metadata_integration {
    data_catalog_config {
        enabled = true

    }
  }


}