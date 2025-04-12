# Describe your resource type here
# Keep "c" as the name to indicate that this resource and its attributes are compliant

resource "google_privateca_certificate_authority" "c" {
    pool = "ca-pool"
    location = "us-central1"
    certificate_authority_id = "test_ca"
    deletion_protection = true
    config {
        subject_config {
            subject {
                organization = "PDE Team"
                common_name = "PDE Team"
            }
            x509_config {
                ca_options {
                    is_ca = true
                }
                key_usage {
                    base_key_usage {
                        cert_sign = true
                        crl_sign = true
                    }
                    extended_key_usage {

                    }
                }
            }
        }
        # 10 years
        lifetime = "${10 * 365 * 24 * 3600}s"
        key_spec {
            algorithm = ""
        }    
    }
}
