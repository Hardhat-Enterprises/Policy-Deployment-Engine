# Describe your resource type here
# Keep "c" as the name to indicate that this resource and its attributes are compliant

resource "google_api_gateway_api_config" "c" {
    api = var.api_path-c
}
