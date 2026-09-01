resource "google_dataproc_metastore_federation" "non_compliant_example_1" {
  version             = "3.1.2"   
  federation_id       = "non_compliant_example_1"
  deletion_protection = true
  project = 1 

  backend_metastores {
    rank           = 5
    metastore_type = "DATAPROC_METASTORE" 
    name           = "projects/acme-data-01/locations/australia-southeast2/services/hive-prod" 
  }
}

