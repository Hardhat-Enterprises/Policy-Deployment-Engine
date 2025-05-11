resource "google_database_migration_service_connection_profile" "env_c" {
  project               = "your-gcp-project-id"
  location              = "us-central1"
  connection_profile_id = "env-compliant"
  display_name          = "Compliant env label"
  labels = {
    env = "prod"
  }

  postgresql {
    host     = "10.0.0.10"
    port     = 5432
    username = "admin"
    password = "StrongPass123"
  }
}
