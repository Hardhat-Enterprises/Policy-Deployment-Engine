resource "google_network_services_http_route" "non_compliant_example_1" {
  name        = "non-compliant-example-1"
  hostnames   = ["example.com"]
  description = "Non-compliant HTTP route with the CORS policy disabled"

  rules {
    action {
      cors_policy {
        disabled = true
      }
    }
  }
}