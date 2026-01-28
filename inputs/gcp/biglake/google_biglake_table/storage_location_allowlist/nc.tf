# Describe your resource type here
# Keep "nc" as the name to indicate that this resource and its attributes are non-compliant

resource "google_biglake_table" "nc" {
  name     = "storage_location_allowlist_non_compliant"
  database = google_biglake_database.database.id
  type     = "HIVE"

  hive_options {
    storage_descriptor {
      location_uri = "gs://random-public-bucket/data/"
    }
  }
}
