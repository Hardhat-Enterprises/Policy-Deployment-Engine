# Describe your resource type here
# Keep "c" as the name to indicate that this resource and its attributes are compliant

resource "google_sql_database_instance" "c" {
  name             = "secure-db-instance"
  project          = "terraform-453808"                # <-- Add this line
  region           = "australia-southeast1"
  database_version = "MYSQL_8_0"

  settings {
    tier = "db-f1-micro"
  }

  deletion_protection = true
}
