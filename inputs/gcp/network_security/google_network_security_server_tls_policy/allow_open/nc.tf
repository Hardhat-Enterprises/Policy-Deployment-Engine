resource "google_network_security_server_tls_policy" "nc" {

  name       = "nc"
  project    = "123"
  allow_open = true

  server_certificate {
    certificate_provider_instance {
      plugin_instance = "google_cloud_private_spiffe"
    }
  }
}