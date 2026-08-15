resource "google_network_services_http_route" "non_compliant_example_1" {
  name        = "non-compliant-example-1"
  hostnames   = ["example.com"]
  description = "Non-compliant HTTP route that removes a browser-security header"

  rules {
    action {
      response_header_modifier {
        remove = ["Content-Security-Policy"]
      }
    }
  }
}