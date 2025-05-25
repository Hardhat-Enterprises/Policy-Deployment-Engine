# Describe your resource type here
# Keep "nc" as the name to indicate that this resource and its attributes are non-compliant

resource "google_api_gateway_api_config" "nc" {
  provider = google-beta
  api      = var.api_path
  project  = "terraform-456801"

  
  openapi_documents {
    document {
      path     = "openapi-spec.yaml"
      contents = filebase64("${path.module}/openapi-spec.yaml")
    }
  }


  gateway_config {
    backend_config {
      google_service_account = "bad-service@notallowed.com"
    }
  }
}