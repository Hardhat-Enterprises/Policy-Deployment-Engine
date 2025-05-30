# Describe your resource type here
# Keep "c" as the name to indicate that this resource and its attributes are compliant

resource "google_api_gateway_api_config" "c" {
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
      google_service_account = "gateway-backend-sa@api_cfg.iam.gserviceaccount.com"
    }
  }
}

