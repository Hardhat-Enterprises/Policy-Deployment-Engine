# Describe your resource type here
# Keep "c" as the name to indicate that this resource and its attributes are compliant

resource "google_biglake_database" "c" {
  name    = "c"
  catalog = "projects/pde-dummy-project/locations/au/catalogs/pde_dummy_catalog"
  type    = "HIVE"

  hive_options {
    location_uri = "gs://org-au-biglake-metadata/metadata/"
  }
}
