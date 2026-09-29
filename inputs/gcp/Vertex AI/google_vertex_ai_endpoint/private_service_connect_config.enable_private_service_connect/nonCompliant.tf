resource "google_vertex_ai_endpoint" "non_compliant_example_1" {
  name         = "non_compliant_example_1"
  display_name = "sample-endpoint"
  location     = "us-central1"

  private_service_connect_config {
    enable_private_service_connect = false
  }
}