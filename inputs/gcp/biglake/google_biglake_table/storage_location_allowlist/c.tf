# Describe your resource type here
# Keep "c" as the name to indicate that this resource and its attributes are compliant

resource "google_biglake_table" "c" {
  name     = "storage_location_allowlist_compliant"
  database = google_biglake_database.database.id
  type     = "HIVE"

  hive_options {
    storage_descriptor {
      location_uri = "gs://org-au-biglake-data/data/"
    }
  }
}
