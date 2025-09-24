resource "google_dataproc_metastore_federation" "c" {
  version = "3.1.2"   
  federation_id = "metastore-fed" 
  location = "australia-southeast2"
  project = 2 

  backend_metastores {
    rank           = 0
    metastore_type = "DATAPROC_METASTORE" # allowed type
    name           = "projects/acme-data-01/locations/australia-southeast2/services/hive-prod" # AU region, valid format
  }
}

