# Non-compliant example for enforce_key_restrictions
resource "google_apikeys_key" "nc" {
  name         = "nc"
  display_name = "Non-compliant key (no restrictions)"
  project = "my-gcp-project"
  restrictions {
    
  }
}
