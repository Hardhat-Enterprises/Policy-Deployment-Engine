resource "google_vertex_ai_endpoint" "non_compliant_example_1" {
  name         = "endpoint-name"
  display_name = "sample-endpoint"
  location     = "europe-west1"
}

resource "google_vertex_ai_endpoint" "non_compliant_example_2" {
  name         = "endpoint-name"
  display_name = "sample-endpoint"
  # location is omitted
}