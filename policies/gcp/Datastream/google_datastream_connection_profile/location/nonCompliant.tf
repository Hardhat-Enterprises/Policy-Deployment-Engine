# Tests the location argument.
# The connection profile is created outside the approved Australian regions.

resource "google_datastream_connection_profile" "non_compliant_example_1" {
  display_name          = "location-test-profile"
  location              = "us-central1"
  connection_profile_id = "location-test-profile"

  bigquery_profile {}
}
