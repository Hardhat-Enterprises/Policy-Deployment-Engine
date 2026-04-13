resource "google_dataproc_metastore_federation" "c" {
  version       = "3.1.2"
  federation_id = "c"
  project       = 1

  backend_metastores {
    rank           = 5
    metastore_type = "BIGQUERY"
    name           = "projects/acme-data-01/locations/australia-southeast2/services/hive-prod"
  }
}

