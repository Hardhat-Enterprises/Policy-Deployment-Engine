# Describe your resource type here
# Keep "c" as the name to indicate that this resource and its attributes are compliant

resource "google_privateca_certificate_authority" "nc" {
    pool = "ca-pool"
    project = "PDE-project"
    location = "us-central1"
    certificate_authority_id = "nc"
    deletion_protection = true
    config {
        subject_config {
            subject {
                organization = ""
                common_name = ""
            }
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
            algorithm = "SIGN_HASH_ALGORITHM_UNSPECIFIED"
        }    
}
