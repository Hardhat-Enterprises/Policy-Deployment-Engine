resource "google_dataproc_metastore_federation" "compliant_example_1" {
  version             = "3.1.2"   
  federation_id       = "compliant_example_1" 
  project = 1

  backend_metastores {
    rank           = 5
    metastore_type = "BIGQUERY" 
    name           = "projects/acme-data-01/locations/australia-southeast2/services/hive-prod" 
  }
}

