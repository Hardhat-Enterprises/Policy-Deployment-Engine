# Compliant example for require_restrictions

resource "google_apikeys_key" "c" {
  name         = "apikey-restrictions-compliant"
  display_name = "Compliant key (has restrictions)"
  restrictions {
    api_targets {
      service = "maps.googleapis.com"
    }
  }
}
