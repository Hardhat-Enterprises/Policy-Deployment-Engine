resource "google_network_security_client_tls_policy" "c" {

  name = "c"

  server_certificate {
    certificate_provider_instance {
      plugin_instance = "google_cloud_private_spiffe"
    }
  }
}