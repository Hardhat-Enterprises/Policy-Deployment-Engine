resource "google_network_security_client_tls_policy" "non_compliant_example_1" {
  name = "non_compliant_example_1"

  server_validation_ca {
    certificate_provider_instance {
      plugin_instance = "custom_unmanaged_plugin"
    }
  }
}
