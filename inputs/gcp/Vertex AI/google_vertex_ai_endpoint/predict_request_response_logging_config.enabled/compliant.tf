resource "google_vertex_ai_endpoint" "compliant_example_1" {
  name         = "endpoint-name"
  display_name = "sample-endpoint"
  location     = "us-central1"
  
  predict_request_response_logging_config {
    enabled = true
  }
}