resource "google_vertex_ai_endpoint" "non_compliant_example_1" {
  name         = "non_compliant_example_1"
  display_name = "sample-endpoint"
  location     = "us-central1"
  
  predict_request_response_logging_config {
    enabled = false
  }
}

resource "google_vertex_ai_endpoint" "non_compliant_example_2" {
  name         = "non_compliant_example_1"
  display_name = "sample-endpoint"
  location     = "us-central1"
  # predict_request_response_logging_config is omitted
}