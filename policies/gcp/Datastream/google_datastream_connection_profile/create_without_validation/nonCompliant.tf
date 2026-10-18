# Tests the create_without_validation argument.
# The connection profile is created without validation.

resource "google_datastream_connection_profile" "non_compliant_example_1" {
  connection_profile_id = "datastream-connection-profile"
  display_name          = "Datastream Connection Profile"
  location              = "australia-southeast1"

  create_without_validation = true

  gcs_profile {
    bucket    = "example-datastream-bucket"
    root_path = "/datastream"
  }
}
