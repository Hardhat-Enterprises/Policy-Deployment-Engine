resource "google_network_services_edge_cache_origin" "compliant_example_1" {
  name           = "compliant-example-1"
  origin_address = "media-backend.example.com"

  deletion_policy = "PREVENT"
}