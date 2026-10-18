resource "google_dataproc_metastore_federation" "non_compliant_example_1" {
  version = "3.1.2"   
  federation_id = "non_compliant_example_1"
  location = "global"
  project = 2 

  backend_metastores {
    rank           = 0
    metastore_type = "DATAPROC_METASTORE" # allowed type
    name           = "projects/acme-data-01/locations/australia-southeast2/services/hive-prod" # AU region, valid format
  }
}
