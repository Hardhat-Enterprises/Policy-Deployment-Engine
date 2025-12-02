resource "google_api_gateway_api_config" "nc" {
  provider      = google-beta
  api           = "nc"
  api_config_id = "nc"
  project       = "reliable-alpha-478205-k9"

  openapi_documents {
    document {
      path     = "spec.yaml"
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