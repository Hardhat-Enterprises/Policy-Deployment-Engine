resource "google_certificate_manager_trust_config" "c_trust_config" {
  name        = "c-trust-config-no-allowlist"
  location    = "global"
  description = "Compliant trust config without allowlisted certificates"

  trust_stores {
    trust_anchors {
      pem_certificate = file("${path.module}/ca_cert.pem")
    }
  }
}