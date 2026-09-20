# Tests the mongodb_profile.secret_manager_stored_password argument.
# The MongoDB password uses a fixed secret version instead of the latest version.

resource "google_datastream_connection_profile" "non_compliant_example_1" {
  display_name          = "mongodb-secret-test-profile"
  location              = "australia-southeast1"
  connection_profile_id = "mongodb-secret-test-profile"

  mongodb_profile {
    host_addresses {
      hostname = "mongodb-primary.example.com"
      port     = 27017
    }

    replica_set = "exampleReplicaSet"
    username    = "datastream-user"

    secret_manager_stored_password = "projects/example-project/secrets/mongodb-password/versions/1"

    standard_connection_format {}
  }
}
