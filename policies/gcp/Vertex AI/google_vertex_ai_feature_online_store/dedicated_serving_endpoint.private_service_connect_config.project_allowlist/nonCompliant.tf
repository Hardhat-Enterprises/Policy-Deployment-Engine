resource "google_vertex_ai_feature_online_store" "non_compliant_example_1" {
  name   = "non_compliant_example_1"
  region = "australia-southeast1"

  optimized {}

  dedicated_serving_endpoint {
    private_service_connect_config {
      enable_private_service_connect = true
      project_allowlist              = ["*"]
    }
  }
}