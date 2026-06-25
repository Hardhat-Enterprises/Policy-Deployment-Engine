resource "google_network_security_client_tls_policy" "compliant_example_1" {

  name    = "compliant_example_1"
  project = "123"
  client_certificate {
    certificate_provider_instance {
      plugin_instance = "google_cloud_private_spiffe"
    }
  }
}
