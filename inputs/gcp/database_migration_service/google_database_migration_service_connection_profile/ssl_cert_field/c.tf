resource "google_database_migration_service_connection_profile" "c" {
  project               = "your-gcp-project-id"
  location              = "us-central1"
  connection_profile_id = "compliant-connection-ssl"
  display_name          = "Compliant PostgreSQL Connection - SSL"
  labels = {
    env = "prod"
  }

  postgresql {
    host     = "10.0.0.1"
    port     = 5432
    username = "admin"
    password = "securepassword"
    ssl {
      type               = "REQUIRED"
      client_key         = "dummy-client-key"
      client_certificate = "dummy-client-cert"
      ca_certificate     = "dummy-ca-cert"
    }
    cloud_sql_id = "pg-compliant"
  }
}
