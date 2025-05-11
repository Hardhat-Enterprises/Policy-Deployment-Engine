# Describe your resource type here
# Keep "nc" as the name to indicate that this resource and its attributes are non-compliant

resource "google_sql_database" "nc" {
  name            = "insecure-database"
  instance        = google_sql_database_instance.nc.name
  deletion_policy = "DELETE"
}