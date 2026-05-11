resource "google_network_security_client_tls_policy" "c" {

  name    = "c"
  project = "123"
  server_validation_ca {
    grpc_endpoint {
      target_uri = "unix:mypath"
    }
  }
}