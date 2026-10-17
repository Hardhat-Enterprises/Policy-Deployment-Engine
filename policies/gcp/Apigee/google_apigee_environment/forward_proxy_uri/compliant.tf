resource "google_apigee_environment" "compliant_example_1" {
  name         = "compliant_example_1"
  description  = "Apigee Environment"
  display_name = "compliant-environment"
  org_id       = "organizations/pde-org"
  forward_proxy_uri = "https://proxy.example.com:8080"
  client_ip_resolution_config {
    header_index_algorithm {
      ip_header_name  = "X-Forwarded-For"
      ip_header_index = -1
    }
  }
}
