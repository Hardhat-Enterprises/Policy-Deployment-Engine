# Describe your resource type here
# Keep "c" as the name to indicate that this resource and its attributes are compliant


resource "google_api_gateway_api_config_iam_member" "c" {
  provider   = google-beta
  project    = "terraform-456801"
  api        = var.api_path  # This is the API name
  api_config = "sample-api-config"
  role       = "roles/viewer"
  member     = "user:user@gmail.com"
}
