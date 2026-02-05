# Describe your resource type here
# Keep "c" as the name to indicate that this resource and its attributes are compliant

resource "google_biglake_table" "c" {
  name     = "storage_location_prefix_compliant"
  database = "projects/pde-dummy-project/locations/au/catalogs/pde_dummy_catalog/databases/pde_dummy_database"
  type     = "HIVE"

  hive_options {
    storage_descriptor {
      location_uri = "gs://secure-data-bucket/table-path"
    }
  }
}

