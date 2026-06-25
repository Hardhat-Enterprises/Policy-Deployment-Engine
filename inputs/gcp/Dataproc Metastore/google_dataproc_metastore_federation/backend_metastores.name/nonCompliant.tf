resource "google_dataproc_metastore_federation" "non_compliant_example_1" {
  version             = "3.0.0"  
  federation_id       = "non_compliant_example_1"
  project = 1 

  backend_metastores {
    rank           = 0
    metastore_type = "METASTORE_TYPE_UNSPECIFIED" 
    name           = "projects/acme-data-01/locations/us-central1/services/test" 
  }
}

