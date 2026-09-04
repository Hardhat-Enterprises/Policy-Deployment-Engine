resource "google_vertex_ai_endpoint" "non_compliant_example_1" {
  name         = "non_compliant_example_1"
  display_name = "sample-endpoint"
  location     = "us-central1"
  network      = "projects/123456789/global/networks/invalid-network-999"
}