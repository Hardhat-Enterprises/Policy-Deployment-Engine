resource "google_vertex_ai_endpoint" "compliant_example_1" {
  name         = "endpoint-name"
  display_name = "sample-endpoint"
  location     = "us-central1"

  private_service_connect_config {
    enable_private_service_connect = true
  }
}