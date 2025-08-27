# Describe your resource type here
# Keep "c" as the name to indicate that this resource and its attributes are compliant


resource "google_dataproc_metastore_federation" "c" {
  version             = "3.1.2"   # >= required minimum
  federation_id       = "metastore-fed" # good format
  location = "Global"
  project = 1 

  backend_metastores {
    rank           = 0
    metastore_type = "DATAPROC_METASTORE" # allowed type
    name           = "projects/acme-data-01/locations/australia-southeast2/services/hive-prod" # AU region, valid format
  }
}

