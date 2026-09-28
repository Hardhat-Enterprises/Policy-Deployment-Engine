resource "google_network_services_http_route" "compliant_example_1" {
  name        = "compliant-example-1"
  hostnames   = ["example.com"]

  rules {
    matches {
      full_path_match = "/status"
      headers {
        header      = "x-tenant-id"
        regex_match = "^tenant-[0-9]+$"
      }
    }
  }
}