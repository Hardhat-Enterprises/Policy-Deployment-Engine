resource "google_privateca_certificate_authority" "nc" {
  // This example assumes this pool already exists.
  // Pools cannot be deleted in normal test circumstances, so we depend on static pools
  pool = "ca-pool"
  certificate_authority_id = "nc"
  location = "us-central1"
  deletion_protection = false
  config {
    subject_config {
      subject {
        organization = "ACME"
        common_name = "my-certificate-authority"
      }
    }
    x509_config {
      ca_options {
        # is_ca *MUST* be true for certificate authorities
        is_ca = true
      }
      key_usage {
        base_key_usage {
          # cert_sign and crl_sign *MUST* be true for certificate authorities
          cert_sign = true
          crl_sign = true
        }
        extended_key_usage {
        }
      }
    }
  }
  # valid for 10 years
  lifetime = "${10 * 365 * 24 * 3600}s"
  key_spec {
    algorithm = "RSA_PSS_2048_SHA256"
  }
}
