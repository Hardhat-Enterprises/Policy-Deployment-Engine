resource "google_network_security_client_tls_policy" "nc" {

  name    = "nc"
  project = "123"
  client_certificate {
    certificate_provider_instance {
      plugin_instance = "google_cloud_private"
    }
  }
}