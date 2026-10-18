resource "google_network_security_server_tls_policy" "compliant_example_1" {

  name       = "compliant_example_1"
  project    = "123"
  allow_open = false

  server_certificate {
    certificate_provider_instance {
      plugin_instance = "google_cloud_private_spiffe"
    }
  }
}
