resource "google_dataproc_metastore_service" "compliant_example_1" {
  service_id = "compliant_example_1"
  project = 1

  metadata_integration {
    data_catalog_config {
        enabled = true

    }
  }

}
