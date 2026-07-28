# Non-compliant example for disallow_wildcard_methods

resource "google_apikeys_key" "non_compliant_example_1" {
  name         = "non_compliant_example_1"
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
