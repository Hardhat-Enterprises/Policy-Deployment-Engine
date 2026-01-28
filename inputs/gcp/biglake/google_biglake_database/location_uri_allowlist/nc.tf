# Describe your resource type here
# Keep "nc" as the name to indicate that this resource and its attributes are non-compliant

resource "google_biglake_database" "database" {
  name    = "location_uri_allowlist_non_compliant"
  catalog = google_biglake_catalog.catalog.id
  type    = "HIVE"

  hive_options {
    location_uri = "gs://random-public-bucket/metadata/"
  }
}
