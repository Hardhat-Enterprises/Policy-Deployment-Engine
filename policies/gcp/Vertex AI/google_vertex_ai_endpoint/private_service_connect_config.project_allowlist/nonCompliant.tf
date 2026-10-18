resource "google_vertex_ai_endpoint" "non_compliant_example_1" {
  name         = "non-compliant-endpoint-1"
  display_name = "sample-endpoint"
  location     = "us-central1"
  private_service_connect_config {
    enable_private_service_connect = true
  }
}

resource "google_vertex_ai_endpoint" "non_compliant_example_2" {
  name         = "non-compliant-endpoint-2"
  display_name = "sample-endpoint"
  location     = "us-central1"
  private_service_connect_config {
    enable_private_service_connect = true
    project_allowlist              = []
  }
}