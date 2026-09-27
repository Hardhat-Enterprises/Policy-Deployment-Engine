resource "google_vertex_ai_endpoint" "compliant_example_1" {
  name                       = "compliant_example_1"
  display_name               = "sample-endpoint"
  location                   = "us-central1"
  dedicated_endpoint_enabled = true
}