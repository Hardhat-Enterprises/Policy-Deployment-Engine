resource "google_network_security_security_profile" "non_compliant_example_1" {
  name     = "non_compliant_example_1"
  type     = "THREAT_PREVENTION"
  location = "EUROPE-WEST8"
}
