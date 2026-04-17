resource "google_network_security_client_tls_policy" "nc" {

  name = "nc"
  project = "123"
  server_validation_ca {
    grpc_endpoint {
      target_uri = "mypath"
    }
  }
}