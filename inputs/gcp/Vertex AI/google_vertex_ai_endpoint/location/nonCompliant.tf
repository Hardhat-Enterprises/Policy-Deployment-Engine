resource "google_vertex_ai_endpoint" "non_compliant_example_1" {
  name         = "endpoint-name"
  display_name = "sample-endpoint"
  location     = "europe-west1"
}
