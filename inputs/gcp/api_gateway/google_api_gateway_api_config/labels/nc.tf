resource "google_api_gateway_api_config" "nc" {
  provider = google-beta
  api = "my-api-id-nc"
  api_config_id = "my-api-config-id-nc"
  project = "reliable-alpha-478205-k9"

  openapi_documents {
    document {
      path = "spec.yaml"
      contents = filebase64("openapi.yml")
    }
  }
  lifecycle {
    create_before_destroy = true
  }

  labels = {
    environment = "production"
    owner       = "team-a"
  }
}