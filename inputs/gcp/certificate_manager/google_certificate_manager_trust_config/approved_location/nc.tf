resource "google_certificate_manager_trust_config" "nc" {
  name     = "nc"
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