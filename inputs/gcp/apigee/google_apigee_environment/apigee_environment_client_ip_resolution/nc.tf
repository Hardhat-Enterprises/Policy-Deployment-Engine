resource "google_apigee_environment" "nc" {
  name         = "nc"
  description  = "Apigee Environment"
  display_name = "non-compliant-environment"
  org_id       = "organizations/pde-org"
  forward_proxy_uri = "ftp://bad-proxy.example.com:8080"
  client_ip_resolution_config {
    header_index_algorithm {
      ip_header_name  = "X-Forwarded-For"
      ip_header_index = 1
    }
  }
}