# Describe your resource type here
# Keep "nc" as the name to indicate that this resource and its attributes are non-compliant

resource "google_api_gateway_api_config" "nc" {
  api_config_id = "user-auth-api-config-nc"
}