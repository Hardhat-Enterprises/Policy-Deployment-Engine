# Describe your resource type here
# Keep "c" as the name to indicate that this resource and its attributes are compliant

resource "google_api_gateway_api_config_iam_binding" "c" {
  api_config = var.api_config_path
  role       = "roles/apigateway.viewer"
  

  members = [
    "allAuthenticatedUsers"  # Compliant: Only signed-in users can access
  ]
}


