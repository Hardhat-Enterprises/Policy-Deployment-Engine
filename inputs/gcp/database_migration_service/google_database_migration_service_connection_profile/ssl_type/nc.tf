resource "google_database_migration_service_connection_profile" "nc" {
  project               = "your-gcp-project-id"
  location              = "us-central1"
  connection_profile_id = "noncompliant-connection"
  display_name          = "Non-Compliant PostgreSQL Connection"
  labels = {
    env = "dev"
  }

  postgresql {
    host     = "10.0.0.2"
    port     = 5432
    username = "admin"
    password = "weakpassword"
    ssl {
      type = "NONE"
    }
    cloud_sql_id = "pg-noncompliant"
  }
}
