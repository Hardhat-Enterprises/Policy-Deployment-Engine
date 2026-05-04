resource "google_certificate_manager_trust_config" "nc_trust_config" {
  name     = "nc-trust-config-location"
  location = "us-central1"

  trust_stores {
    trust_anchors {
      pem_certificate = file("${path.module}/ca_cert.pem")
    }
  }

  labels = {
    environment = "prod"
  }
}