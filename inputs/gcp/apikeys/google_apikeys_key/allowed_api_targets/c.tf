# Compliant example for allowed_api_targets policy

resource "google_apikeys_key" "c" {
  name         = "c"
  display_name = "Compliant API key for allowed_api_targets test"
  project = "my-gcp-project"

  restrictions {
    api_targets {
      service = "maps.googleapis.com"
    }
  }
}
