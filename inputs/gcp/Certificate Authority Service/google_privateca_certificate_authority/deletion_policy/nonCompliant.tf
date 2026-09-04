resource "google_privateca_certificate_authority" "non_compliant_example_1" {
  pool                     = "ca-pool"
  certificate_authority_id = "non_compliant_example_1"
  location                 = "australia-southeast1"
  deletion_policy          = "DELETE"

  config {
    subject_config {
      subject {
        organization = "ACME"
        common_name  = "my-certificate-authority"
      }
    }
    x509_config {
      ca_options {
        is_ca = true
      }
      key_usage {
        base_key_usage {
          cert_sign = true
          crl_sign  = true
        }
        extended_key_usage {}
      }
    }
  }

  lifetime = "${10 * 365 * 24 * 3600}s"
  key_spec {
    algorithm = "EC_P384_SHA384"
  }
}
