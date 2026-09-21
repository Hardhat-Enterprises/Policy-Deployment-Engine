resource "google_database_migration_service_connection_profile" "non_compliant_example_1" {
  connection_profile_id = "non_compliant_example_1"
  display_name          = "dbms_mj_compliant"
  location              = "australia-southeast2"
  project               = "gcp-project-id"
  deletion_policy = "DELETE"

  mysql {
    host     = "host"
    port     = 3306
    username = "username"
    password = "password"

    ssl {
      type = "REQUIRED"
    }
  }
}
