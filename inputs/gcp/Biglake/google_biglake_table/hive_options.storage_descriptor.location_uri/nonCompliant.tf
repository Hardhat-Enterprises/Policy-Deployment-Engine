# Describe your resource type here
# Keep "nc" as the name to indicate that this resource and its attributes are non-compliant

resource "google_biglake_table" "non_compliant_example_1" {
  name     = "non_compliant_example_1"
  database = "projects/pde-dummy-project/locations/au/catalogs/pde_dummy_catalog/databases/pde_dummy_database"
  type     = "HIVE"

  hive_options {
    storage_descriptor {
      location_uri = "gs://random-public-bucket/data/"
    }
  }
}
