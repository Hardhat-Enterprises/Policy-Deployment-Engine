resource "google_network_security_client_tls_policy" "compliant_example_1" {
  name = "compliant_example_1"

  server_validation_ca {
    certificate_provider_instance {
      plugin_instance = "google_cloud_private_spiffe"
    }
  }
}
