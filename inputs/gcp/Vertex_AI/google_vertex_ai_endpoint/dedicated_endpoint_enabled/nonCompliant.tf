resource "google_vertex_ai_endpoint" "non_compliant_example_1" {
  name                       = "endpoint-name"
  display_name               = "sample-endpoint"
  location                   = "us-central1"
  dedicated_endpoint_enabled = false
}

resource "google_vertex_ai_endpoint" "non_compliant_example_2" {
  name         = "endpoint-name"
  display_name = "sample-endpoint"
  location     = "us-central1"
  # dedicated_endpoint_enabled is omitted (defaults to false)
}