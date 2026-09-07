resource "google_pubsub_schema" "non_compliant_example_1" {
  name = "non_compliant_example_1"
  type = "TYPE_UNSPECIFIED"
  definition = "syntax = \"proto3\"; message Results { string message_request = 1; string message_response = 2; }"
}
