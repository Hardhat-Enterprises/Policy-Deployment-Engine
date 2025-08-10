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
                organization = "PDE Team"
                common_name = "PDE Team"
            }
        }
        x509_config {
                ca_options {
                    is_ca = true
                    max_issuer_path_length = 4
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
    type = "SUBORDINATE"
    key_spec {
            algorithm = ""
        }
        
    
}
resource "google_privateca_certificate_authority" "nc1" {
    pool = "ca-pool"
    project = "PDE-project"
    location = "us-central1"
    certificate_authority_id = "nc1"
    deletion_protection = true
    config {
        subject_config {
            subject {
                organization = "PDE Team"
                common_name = "PDE Team"
            }
        }
        x509_config {
                ca_options {
                    is_ca = true
                    max_issuer_path_length = 6
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
    type = "SELF_SIGNED"
    key_spec {
            algorithm = ""
        }
        
    
}
