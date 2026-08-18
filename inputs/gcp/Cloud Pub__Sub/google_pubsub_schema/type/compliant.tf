resource "google_pubsub_schema" "compliant_example_1" {
  name       = "compliant_example_1"
  type       = "PROTOCOL_BUFFER"
  definition = "syntax = \"proto3\"; message Results { string message_request = 1; string message_response = 2; }"
}
