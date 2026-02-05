# Non-compliant example for allowed_api_targets policy

resource "google_apikeys_key" "nc" {
  name         = "apikey_allowed_api-targets_non_compliant"
  display_name = "Non-compliant API key for allowed_api_targets test"

  restrictions {
    api_targets {
      service = "storage.googleapis.com"
    }
  }
}
