# 1 
resource "google_kms_ekm_connection" "non_compliant_example_1" {
  name                = "non_compliant_example_1"
  location            = "us-central1"
  key_management_mode = "MANUAL"

  service_resolvers {
    service_directory_service = "projects/my-project/locations/us-central1/namespaces/ns/services/svc"
    hostname                  = "malicious.example.com"
    server_certificates {
      raw_der = "dummy"
    }
  }
}

# 2 
resource "google_kms_ekm_connection" "non_compliant_example_2" {
  name                = "non_compliant_example_2"
  location            = "australia-southeast1"
  key_management_mode = "MANUAL"

  service_resolvers {
    service_directory_service = "projects/my-project/locations/us-central1/namespaces/ns/services/svc"
    hostname                  = "malicious.example.com"
    server_certificates {
      raw_der = "dummy"
    }
  }
}
