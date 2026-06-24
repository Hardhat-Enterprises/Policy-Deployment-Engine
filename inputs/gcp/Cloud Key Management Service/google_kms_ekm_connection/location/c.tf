resource "google_kms_ekm_connection" "c1" {
  name                = "c1"
  location            = "australia-southeast1"
  key_management_mode = "MANUAL"

  service_resolvers {
    service_directory_service = "projects/my-project/locations/australia-southeast1/namespaces/ns/services/svc"
    hostname                  = "ekm-au.trusted.example.com"
    server_certificates {
      raw_der = "dummy"
    }
  }
}