# Describe your resource type here
# Keep "nc" as the name to indicate that this resource and its attributes are non-compliant

resource "google_api_gateway_api_config_iam_binding" "nc" {
  api_config = var.api_config_path
  role       = "roles/apigateway.viewer"

  members = [
    "allUsers"  # Non-Compliant: Public access to API config
  ]
}
