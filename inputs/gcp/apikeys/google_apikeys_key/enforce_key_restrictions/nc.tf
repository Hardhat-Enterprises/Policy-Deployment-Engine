# Non-compliant example for enforce_key_restrictions
resource "google_apikeys_key" "nc" {
  name         = "apikey_restrictions_non_compliant"
  display_name = "Non-compliant key (no restrictions)"
}
