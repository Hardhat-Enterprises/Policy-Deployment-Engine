# Describe your resource type here
# Keep "c" as the name to indicate that this resource and its attributes are compliant

resource "google_biglake_database" "c" {
  name    = "enforce_type_hive_compliant"
  catalog = google_biglake_catalog.catalog.id
  type    = "HIVE"

  hive_options {
    location_uri = "gs://org-au-biglake-metadata/metadata/"
  }
}
