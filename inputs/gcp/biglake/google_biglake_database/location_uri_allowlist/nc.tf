# Describe your resource type here
# Keep "nc" as the name to indicate that this resource and its attributes are non-compliant

resource "google_biglake_database" "database" {
  name    = "location_uri_allowlist_non_compliant"
  catalog = catalog = "projects/pde-dummy-project/locations/au/catalogs/pde_dummy_catalog"
  type    = "HIVE"

  hive_options {
    location_uri = "gs://random-public-bucket/metadata/"
  }
}
