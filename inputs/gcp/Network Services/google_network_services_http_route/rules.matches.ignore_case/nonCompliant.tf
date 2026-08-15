resource "google_network_services_http_route" "non_compliant_example_1" {
  name        = "non-compliant-example-1"
  hostnames   = ["example.com"]
  description = "Non-compliant HTTP route with case-insensitive path matching"

  rules {
    matches {
      full_path_match = "/status"
      ignore_case     = true
    }
  }
}