# Compliant example for disallow_wildcard_methods

resource "google_apikeys_key" "c" {
  name         = "apikey_wildcard_methods_compliant"
  display_name = "Compliant key (no wildcard methods)"

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
