resource "google_api_gateway_api_config" "c" {
  provider      = google-beta
  api           = "c"
  api_config_id = "c"
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
    sensitivity = "restricted"
    cost_center = "ENG-001"
  }
}