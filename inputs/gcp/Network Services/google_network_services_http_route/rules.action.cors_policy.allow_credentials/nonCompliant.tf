resource "google_network_services_http_route" "non_compliant_example_1" {
  name        = "non-compliant-example-1"
  hostnames   = ["example.com"]
  description = "Non-compliant HTTP route that allows CORS credentials"

  rules {
    action {
      cors_policy {
        allow_credentials = true
      }
    }
  }
}