# Non-compliant example for disallow_wildcard_methods

resource "google_apikeys_key" "nc" {
  name         = "apikey-wildcard-methods-non-compliant"
  display_name = "Non-compliant key (wildcard methods)"

  restrictions {
    api_targets {
      service = "maps.googleapis.com"
      methods = [
        "*",
        "GET"
      ]
    }
  }
}
