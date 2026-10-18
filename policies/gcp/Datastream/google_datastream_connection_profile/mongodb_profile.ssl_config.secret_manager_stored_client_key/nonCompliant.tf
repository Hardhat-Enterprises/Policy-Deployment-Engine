# Tests mongodb_profile.ssl_config.secret_manager_stored_client_key.
# The MongoDB TLS client key references a fixed Secret Manager version.

resource "google_datastream_connection_profile" "non_compliant_example_1" {
  display_name          = "mongodb-client-key-test-profile"
  location              = "australia-southeast1"
  connection_profile_id = "mongodb-client-key-test-profile"

  mongodb_profile {
    host_addresses {
      hostname = "mongodb-primary.example.com"
      port     = 27017
    }

    replica_set = "exampleReplicaSet"
    username    = "datastream-user"

    secret_manager_stored_password = "projects/example-project/secrets/mongodb-password/versions/latest"

    standard_connection_format {}

    ssl_config {
      secret_manager_stored_client_key = "projects/example-project/hello/mongodb-client-key/versions/1"
    }
  }
}
