resource "google_certificate_manager_trust_config" "nc" {
  name        = "nc"
  location    = "global"
  description = "Non-compliant trust config with allowlisted certificate"

  trust_stores {
    trust_anchors {
      pem_certificate = file("${path.module}/ca_cert.pem")
    }
  }

  allowlisted_certificates {
    pem_certificate = file("${path.module}/ca_cert.pem")
  }
}
