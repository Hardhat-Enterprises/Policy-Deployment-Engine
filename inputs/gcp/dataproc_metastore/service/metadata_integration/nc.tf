resource "google_dataproc_metastore_service" "nc" {
  service_id = "metastore-srv"
  project = 1

  metadata_integration {
    data_catalog_config {
        enabled = false

    }
  }


}