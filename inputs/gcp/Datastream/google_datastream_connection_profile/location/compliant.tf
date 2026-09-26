# Tests the location argument.
# The connection profile is created in an approved Australian region.

resource "google_datastream_connection_profile" "compliant_example_1" {
  display_name          = "location-test-profile"
  location              = "australia-southeast1"
  connection_profile_id = "location-test-profile"

  bigquery_profile {}
}
