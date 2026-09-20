# Tests the oracle_profile.secret_manager_stored_password argument.
# The Oracle password references a fixed Secret Manager version.

resource "google_datastream_connection_profile" "non_compliant_example_1" {
  display_name          = "oracle-secret-test-profile"
  location              = "australia-southeast1"
  connection_profile_id = "oracle-secret-test-profile"

  oracle_profile {
    hostname         = "oracle.example.com"
    port             = 1521
    username         = "datastream-user"
    database_service = "ORCL"

    secret_manager_stored_password = "projects/example-project/secrets/oracle-password/versions/1"
  }
}
