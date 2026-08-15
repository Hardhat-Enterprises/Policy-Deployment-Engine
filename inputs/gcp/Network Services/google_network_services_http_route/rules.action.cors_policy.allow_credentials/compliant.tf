resource "google_network_services_http_route" "compliant_example_1" {
  name        = "compliant-example-1"
  hostnames   = ["example.com"]
  description = "Compliant HTTP route that does not allow CORS credentials"

  rules {
    action {
      cors_policy {
        allow_credentials = false
      }
    }
  }
}