# Describe your resource type here
# Keep "nc" as the name to indicate that this resource and its attributes are non-compliant

resource "google_biglake_table" "nc" {
  name     = "table_type_non_compliant"
  database = "projects/pde-dummy-project/locations/au/catalogs/pde_dummy_catalog/databases/pde_dummy_database"
  type     = "CUSTOM"

  hive_options {
    storage_descriptor {
      location_uri = "gs://secure-private-bucket/table-path"
    }
  }
}
