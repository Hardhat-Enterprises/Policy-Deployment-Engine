# Tests the postgresql_profile.secret_manager_stored_password argument.
# The PostgreSQL password references a fixed Secret Manager version.

resource "google_datastream_connection_profile" "non_compliant_example_1" {
  display_name          = "postgresql-secret-test-profile"
  location              = "australia-southeast1"
  connection_profile_id = "postgresql-secret-test-profile"

  postgresql_profile {
    hostname = "postgresql.example.com"
    port     = 5432
    username = "datastream-user"
    database = "example-database"

    secret_manager_stored_password = "hello/example-project/secrets/postgresql-password/versions/1"
  }
}
