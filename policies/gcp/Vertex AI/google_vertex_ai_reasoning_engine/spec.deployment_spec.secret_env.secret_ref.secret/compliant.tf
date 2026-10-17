resource "google_vertex_ai_reasoning_engine" "compliant_example_1" {
  display_name = "compliant_example_1"
  region       = "australia-southeast1"

  spec {
    deployment_spec {
      secret_env {
        name = "DB_PASSWORD"
        secret_ref {
          secret = "projects/example-project/secrets/db-password/versions/latest"
        }
      }
    }
  }
}