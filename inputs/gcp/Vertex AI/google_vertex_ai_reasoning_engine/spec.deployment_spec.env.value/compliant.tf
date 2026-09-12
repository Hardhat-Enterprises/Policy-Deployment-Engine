resource "google_vertex_ai_reasoning_engine" "compliant_example_1" {
  display_name = "compliant_example_1"
  region       = "australia-southeast1"

  spec {
    deployment_spec {
      env {
        name  = "LOG_LEVEL"
        value = "info"
      }
    }
  }
}
