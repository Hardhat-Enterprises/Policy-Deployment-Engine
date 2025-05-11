resource "google_database_migration_service_connection_profile" "nc" {
  project               = "your-gcp-project-id"
  location              = "us-central1"
  connection_profile_id = "noncompliant-connection-cloudsqlid"
  display_name          = "Non-Compliant PostgreSQL Connection - Cloud SQL ID"
  labels = {
    env = "dev"
  }

  postgresql {
    host     = "10.0.0.4"
    port     = 5432
    username = "admin"
    password = "weakpassword"
    ssl {
      type = "REQUIRED"
    }
    cloud_sql_id = ""
  }
}
