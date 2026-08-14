resource "google_network_services_http_route" "compliant_example_1" {
  name        = "compliant-example-1"
  hostnames   = ["example.com"]
  description = "Compliant HTTP route that enforces HTTPS on redirect"

  rules {
    action {
      redirect {
        https_redirect = true
      }
    }
  }
}