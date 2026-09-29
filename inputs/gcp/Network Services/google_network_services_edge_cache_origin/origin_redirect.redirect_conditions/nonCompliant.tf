resource "google_network_services_edge_cache_origin" "non_compliant_example_1" {
  name           = "non-compliant-example-1"
  origin_address = "media-backend.example.com"

  protocol = "HTTPS"

  origin_redirect {
    redirect_conditions = [
      "FOUND"
    ]
  }
}