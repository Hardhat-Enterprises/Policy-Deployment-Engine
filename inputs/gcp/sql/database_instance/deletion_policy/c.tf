# Describe your resource type here
# Keep "c" as the name to indicate that this resource and its attributes are compliant

resource "google_sql_database" "c" {
  name            = "secure-database"
  instance        = google_sql_database_instance.c.name
  deletion_policy = "ABANDON"
}
