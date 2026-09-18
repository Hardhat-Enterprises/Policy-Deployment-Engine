resource "google_vertex_ai_endpoint" "non_compliant_example_1" {
  name         = "non-compliant-endpoint-1"
  display_name = "sample-endpoint"
  location     = "us-central1"
  
}

resource "google_vertex_ai_endpoint" "non_compliant_example_2" {
  name         = "non-compliant-endpoint-2"
  display_name = "sample-endpoint"
  location     = "us-central1"
  network      = "default" # "default" 会被黑名单拦截
}