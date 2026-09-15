resource "google_vertex_ai_endpoint_with_model_garden_deployment" "non_compliant_example_1" {
  location = "australia-southeast1"
  hugging_face_model_id = "Qwen/Qwen3-0.6B"
  deletion_policy = "PREVENT"
  model_config {
    accept_eula = true
    container_spec {
      image_uri = "australia-southeast1-docker.pkg.dev/example-project/models/serving@sha256:aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"
      env {
        name = "LOG_LEVEL"
        value = "info"
      }
    }
  }
  endpoint_config {
    dedicated_endpoint_enabled = false
    private_service_connect_config {
      enable_private_service_connect = true
      project_allowlist = ["example-project"]
    }
  }
}

