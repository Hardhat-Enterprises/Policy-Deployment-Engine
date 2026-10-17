# Tests the deletion_policy argument.
# Terraform is allowed to delete the Datastream connection profile.

resource "google_datastream_connection_profile" "non_compliant_example_1" {
  display_name          = "secure-connection-profile"
  location              = "australia-southeast1"
  connection_profile_id = "secure-connection-profile"

  bigquery_profile {}

  deletion_policy = "DELETE"
}
