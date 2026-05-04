resource "google_certificate_manager_trust_config" "c" {
  name     = "c"
  location = "global"

  trust_stores {
    trust_anchors {
      pem_certificate = file("${path.module}/ca_cert.pem")
    }
  }

  labels = {
    environment = "prod"
  }
}