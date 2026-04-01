# Non-compliant example for allowed_api_targets policy

resource "google_apikeys_key" "nc" {
  name         = "nc"
  display_name = "Non-compliant API key for allowed_api_targets test"
  project = "my-gcp-project"

  restrictions {
    api_targets {
      service = "storage.googleapis.com"
    }
  }
}
