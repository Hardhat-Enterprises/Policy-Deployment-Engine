# Tests the mysql_profile.secret_manager_stored_password argument.
# The MySQL password references a fixed Secret Manager version.

resource "google_datastream_connection_profile" "non_compliant_example_1" {
  display_name          = "mysql-secret-test-profile"
  location              = "australia-southeast1"
  connection_profile_id = "mysql-secret-test-profile"

  mysql_profile {
    hostname = "mysql.example.com"
    port     = 3306
    username = "datastream-user"

    secret_manager_stored_password = "projects/example-project/hello/mysql-password/versions/1"
  }
}
