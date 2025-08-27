# Describe your resource type here
# Keep "nc" as the name to indicate that this resource and its attributes are non-compliant

resource "google_dataproc_metastore_federation" "nc" {
  version             = "3.0.0"   # less than 3.1.2
  federation_id       = "metastore-fed"
  deletion_protection = false
  location = "US"
  project = 1 

  backend_metastores {
    rank           = 5
    metastore_type = "METASTORE_TYPE_UNSPECIFIED" # not in whitelist
    name           = "projects/acme-data-01/locations/us-central1/services/hive-test" # wrong region
  }
}
