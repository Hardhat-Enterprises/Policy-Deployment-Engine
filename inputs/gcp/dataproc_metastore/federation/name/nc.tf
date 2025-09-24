resource "google_dataproc_metastore_federation" "nc" {
  version             = "3.0.0"  
  federation_id       = "_metastore-fed"
  project = 1 

  backend_metastores {
    rank           = 0
    metastore_type = "METASTORE_TYPE_UNSPECIFIED" 
    name           = "/us-central1/services/hive-test" 
  }
}


