resource "google_database_migration_service_connection_profile" "nc" {
  connection_profile_id = "nc"
  display_name          = "dbms_mj_non_compliant"
  location              = "us-central1"
  project               = "gcp-project-id"

  postgresql {
    host     = "host"
    port     = 1521
    username = "username"
    password = "password"

    ssl {
      type = "NONE"
    }
  }
}