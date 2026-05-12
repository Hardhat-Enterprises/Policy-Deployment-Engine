resource "google_certificate_manager_trust_config" "c" {
  name        = "c"
  location    = "global"
  description = "Compliant trust config without allowlisted certificates"

  trust_stores {
    trust_anchors {
      pem_certificate = file("${path.module}/ca_cert.pem")
    }
  }
}
