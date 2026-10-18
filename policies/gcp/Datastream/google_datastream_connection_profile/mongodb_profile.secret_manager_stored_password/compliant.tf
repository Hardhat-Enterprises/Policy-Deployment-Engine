# Tests the mongodb_profile.secret_manager_stored_password argument.
# The MongoDB password uses the latest Secret Manager secret version.

resource "google_datastream_connection_profile" "compliant_example_1" {
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

    secret_manager_stored_password = "projects/example-project/secrets/mongodb-password/versions/latest"

    standard_connection_format {}
  }
}
