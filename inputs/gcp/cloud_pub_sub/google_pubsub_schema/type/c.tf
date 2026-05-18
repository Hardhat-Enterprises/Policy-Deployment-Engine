resource "google_pubsub_schema" "c" {
  name       = "c"
  type       = "PROTOCOL_BUFFER"
  definition = "syntax = \"proto3\"; message Results { string message_request = 1; string message_response = 2; }"
}
