resource "google_network_services_http_route" "non_compliant_example_1" {
  name        = "non-compliant-example-1"
  hostnames   = ["example.com"]
  description = "Non-compliant HTTP route that does not enforce HTTPS on redirect"

  rules {
    action {
      redirect {
        https_redirect = false
      }
    }
  }
}