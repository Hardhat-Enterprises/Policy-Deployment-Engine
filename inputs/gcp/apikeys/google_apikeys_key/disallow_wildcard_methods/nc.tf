# Non-compliant example for disallow_wildcard_methods

resource "google_apikeys_key" "nc" {
  name         = "apikey_wildcard_methods_non_compliant"
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
