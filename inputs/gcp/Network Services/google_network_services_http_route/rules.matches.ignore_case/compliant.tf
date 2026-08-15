resource "google_network_services_http_route" "compliant_example_1" {
  name        = "compliant-example-1"
  hostnames   = ["example.com"]
  description = "Compliant HTTP route with case-sensitive path matching"

  rules {
    matches {
      full_path_match = "/status"
      ignore_case     = false
    }
  }
}