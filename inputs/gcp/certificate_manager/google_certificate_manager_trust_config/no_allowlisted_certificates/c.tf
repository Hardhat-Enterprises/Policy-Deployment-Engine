resource "google_certificate_manager_trust_config" "c" {
  name        = "c"
  project     = "sit764-policy-project"
  location    = "global"
  description = "Compliant trust config without allowlisted certificates"
}