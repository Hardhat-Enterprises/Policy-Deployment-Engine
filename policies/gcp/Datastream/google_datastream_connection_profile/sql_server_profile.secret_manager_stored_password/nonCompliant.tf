# Tests the sql_server_profile.secret_manager_stored_password argument.
# The SQL Server password references a fixed Secret Manager version.

resource "google_datastream_connection_profile" "non_compliant_example_1" {
  display_name          = "sql-server-secret-test-profile"
  location              = "australia-southeast1"
  connection_profile_id = "sql-server-secret-test-profile"

  sql_server_profile {
    hostname = "sql-server.example.com"
    port     = 1433
    username = "datastream-user"
    database = "example-database"

    secret_manager_stored_password = "projects/example-project/secrets/sql-server-password/hello/1"
  }
}
