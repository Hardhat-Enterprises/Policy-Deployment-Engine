# Describe your resource type here
# Keep "nc" as the name to indicate that this resource and its attributes are non-compliant

resource "google_biglake_database" "nc" {
  name    = "enforce_type_hive_non_compliant"
  catalog = "projects/pde-dummy-project/locations/au/catalogs/pde_dummy_catalog"
  type    = "ICEBERG" # not allowed

  hive_options {
    location_uri = "gs://org-au-biglake-metadata/metadata/"
  }
}
