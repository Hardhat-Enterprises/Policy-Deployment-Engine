# Describe your resource type here
# Keep "nc" as the name to indicate that this resource and its attributes are non-compliant

resource "google_api_gateway_api_config_iam_member" "nc" {
  provider   = google-beta
  project    = "terraform-456801"
  api        = "projects/api_cfg/locations/AU/apis/sample-api-noncompliant"
  api_config = "sample-api-config"
  role       = "roles/viewer"
  member     = "allUsers"  # ❌ Grants access to anyone on the internet
}

