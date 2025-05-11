resource "google_database_migration_service_connection_profile" "nc" {
  project               = "your-gcp-project-id"
  location              = "us-central1"
  connection_profile_id = "noncompliant-connection-ssl"
  display_name          = "Non-Compliant PostgreSQL Connection - SSL"
  labels = {
    env = "dev"
  }

  postgresql {
    host     = "10.0.0.2"
    port     = 5432
    username = "admin"
    password = "weakpassword"
    ssl {
      type = "REQUIRED"
      # Missing client_key, client_certificate, and ca_certificate
    }
    cloud_sql_id = "pg-noncompliant"
  }
}
