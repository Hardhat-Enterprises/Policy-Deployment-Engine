resource "google_database_migration_service_connection_profile" "c" {
  project               = "your-gcp-project-id"
  location              = "us-central1"
  connection_profile_id = "compliant-connection-cloudsqlid"
  display_name          = "Compliant PostgreSQL Connection - Cloud SQL ID"
  labels = {
    env = "prod"
  }

  postgresql {
    host     = "10.0.0.3"
    port     = 5432
    username = "admin"
    password = "securepassword"
    ssl {
      type = "REQUIRED"
    }
    cloud_sql_id = "pg-compliant"
  }
}
