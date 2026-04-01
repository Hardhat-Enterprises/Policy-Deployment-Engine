resource "google_dataproc_metastore_federation" "nc" {
  version = "3.0.0"   
  federation_id = "nc"
  location = "global"
  project = 2 

  backend_metastores {
    rank           = 5
    metastore_type = "METASTORE_TYPE_UNSPECIFIED" # not in whitelist
    name           = "projects/acme-data-01/locations/us-central1/services/hive-test" # wrong region
  }
}
