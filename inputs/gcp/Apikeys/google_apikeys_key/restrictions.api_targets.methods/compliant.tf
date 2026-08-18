# Compliant example for disallow_wildcard_methods

resource "google_apikeys_key" "compliant_example_1" {
  name         = "compliant_example_1"
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
