resource "google_privateca_certificate" "non_compliant_example_1" {
  name            = "non-compliant-example-1"
  pool            = "ca-pool"
  location        = "us-central1"
  lifetime        = "86400s"
  deletion_policy = "PREVENT"

  config {
    public_key {
      format = "PEM"
      key    = local.certificate_public_key
    }
    subject_config {
      subject {
        organization = "ACME"
        common_name  = "compliant.example.com"
      }
    }

    x509_config {
      ca_options {
        is_ca = false
      }
      name_constraints {
        critical            = true
        permitted_dns_names = ["example.com"]
      }

      key_usage {
        base_key_usage {
          digital_signature = true
          key_encipherment  = true
        }

        extended_key_usage {
          server_auth = true
        }
      }
    }
  }
}