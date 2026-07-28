resource "google_certificate_manager_trust_config" "compliant_example_1" {
  name        = "compliant_example_1"
  project     = "sit764-policy-project"
  location    = "global"
  description = "Compliant trust config without allowlisted certificates"
}
