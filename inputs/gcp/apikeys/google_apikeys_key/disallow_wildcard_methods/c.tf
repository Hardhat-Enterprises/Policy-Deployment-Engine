# Compliant example for disallow_wildcard_methods

resource "google_apikeys_key" "c" {
  name         = "c"
  display_name = "Compliant key (no wildcard methods)"
  project = "my-gcp-project"

  restrictions {
    api_targets {
      service = "maps.googleapis.com"
      methods = [
        "GET",
        "POST"
      ]
    }
  }
}
