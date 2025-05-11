resource "google_database_migration_service_connection_profile" "env_nc" {
  project               = "your-gcp-project-id"
  location              = "us-central1"
  connection_profile_id = "env-noncompliant"
  display_name          = "Non-Compliant env label"
  labels = {
    env = "dev"
  }

  postgresql {
    host     = "10.0.0.10"
    port     = 5432
    username = "admin"
    password = "StrongPass123"
  }
}
