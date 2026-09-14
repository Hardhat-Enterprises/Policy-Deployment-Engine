resource "google_vertex_ai_reasoning_engine" "non_compliant_example_1" {
  display_name = "non_compliant_example_1"
  region       = "australia-southeast1"

  spec {
    deployment_spec {
      env {
        name  = "DB_PASSWORD"
        value = "my-secret-password"
      }
    }
  }
}
