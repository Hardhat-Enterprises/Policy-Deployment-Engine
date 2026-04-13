# Compliant example for enforce_key_restrictions

resource "google_apikeys_key" "c" {
  name         = "c"
  display_name = "Compliant key (has restrictions)"
  project      = "my-gcp-project"
  restrictions {
    api_targets {
      service = "maps.googleapis.com"
    }
  }
}
