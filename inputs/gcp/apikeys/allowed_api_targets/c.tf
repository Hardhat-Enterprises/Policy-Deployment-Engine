# Compliant example for allowed_api_targets policy

resource "google_apikeys_key" "c" {
  name         = "apikey-allowed-api-targets-compliant"
  display_name = "Compliant API key for allowed_api_targets test"

  restrictions {
    api_targets {
      service = "maps.googleapis.com"
    }
  }
}
