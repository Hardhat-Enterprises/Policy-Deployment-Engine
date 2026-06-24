# 1 Bad hostname
resource "google_kms_ekm_connection" "non_compliant_example_1" {
  name                = "non_compliant_example_1"
  location            = "australia-southeast1"
  key_management_mode = "MANUAL"

  service_resolvers {
    service_directory_service = "projects/my-project/locations/australia-southeast1/namespaces/ns/services/svc"
    hostname                  = "malicious.example.com" # Not whitelisted
    server_certificates {
      raw_der = "AU_CERT_ABC"
    }
  }
}

# 2 Bad cert
resource "google_kms_ekm_connection" "non_compliant_example_2" {
  name                = "non_compliant_example_2"
  location            = "australia-southeast1"
  key_management_mode = "MANUAL"

  service_resolvers {
    service_directory_service = "projects/my-project/locations/australia-southeast1/namespaces/ns/services/svc"
    hostname                  = "ekm-au.trusted.example.com"
    server_certificates {
      raw_der = "BAD_CERT_999" # Not whitelisted
    }
  }
}
