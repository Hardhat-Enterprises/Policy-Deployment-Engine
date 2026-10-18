# Tests the create_without_validation argument.
# Datastream validates the connection profile before creating it.

resource "google_datastream_connection_profile" "compliant_example_1" {
  connection_profile_id = "datastream-connection-profile"
  display_name          = "Datastream Connection Profile"
  location              = "australia-southeast1"

  create_without_validation = false

  gcs_profile {
    bucket    = "example-datastream-bucket"
    root_path = "/datastream"
  }
}
