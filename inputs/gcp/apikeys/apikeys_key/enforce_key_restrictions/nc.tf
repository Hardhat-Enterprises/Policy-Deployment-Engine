# Non-compliant example for require_restrictions

resource "google_apikeys_key" "nc" {
  name         = "apikey-restrictions-non-compliant"
  display_name = "Non-compliant key (no restrictions)"
}
