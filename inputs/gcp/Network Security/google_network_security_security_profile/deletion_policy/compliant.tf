resource "google_network_security_security_profile" "compliant_example_1" {
  name             = "compliant_example_1"
  type             = "THREAT_PREVENTION"
  deletion_policy  = "PREVENT"
}
