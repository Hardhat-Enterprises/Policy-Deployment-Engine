# Non-compliant example for disallow_wildcard_methods

resource "google_apikeys_key" "nc" {
  name         = "nc"
  display_name = "Non-compliant key (wildcard methods)"
  project = "my-gcp-project"

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
