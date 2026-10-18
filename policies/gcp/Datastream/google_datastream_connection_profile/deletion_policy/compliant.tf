# Tests the deletion_policy argument.
# Terraform is prevented from deleting the Datastream connection profile.

resource "google_datastream_connection_profile" "compliant_example_1" {
  display_name          = "secure-connection-profile"
  location              = "australia-southeast1"
  connection_profile_id = "secure-connection-profile"

  bigquery_profile {}

  deletion_policy = "PREVENT"
}
