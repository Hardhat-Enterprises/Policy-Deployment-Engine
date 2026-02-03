# Compliant example for enforce_key_restrictions

resource "google_apikeys_key" "c" {
  name         = "apikey_restrictions_compliant"
  display_name = "Compliant key (has restrictions)"
  restrictions {
    api_targets {
      service = "maps.googleapis.com"
    }
  }
}
