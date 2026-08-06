resource "google_network_services_http_route" "non_compliant_example_1" {
  name        = "non-compliant-example-1"
  hostnames   = ["example.com"]
  description = "Non-compliant HTTP route without deletion protection"

  deletion_policy = "DELETE"
}

resource "google_network_services_http_route" "non_compliant_example_2" {
  name        = "non-compliant-example-2"
  hostnames   = ["example.com"]
  description = "Non-compliant HTTP route using ABANDON"

  deletion_policy = "ABANDON"
}