resource "google_network_services_http_route" "compliant_example_1" {
  name        = "compliant-example-1"
  hostnames   = ["example.com"]

  rules {
    action {
      response_header_modifier {
        remove = ["X-Debug-Info"]
      }
    }
  }
}