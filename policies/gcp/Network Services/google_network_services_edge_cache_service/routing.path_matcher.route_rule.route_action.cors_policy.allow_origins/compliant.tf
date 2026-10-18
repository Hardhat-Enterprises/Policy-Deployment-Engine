resource "google_network_services_edge_cache_service" "compliant_example_1" {
  name = "compliant_example_1"
  routing {
    host_rule {
      hosts        = ["media.example.com"]
      path_matcher = "routes"
    }
    path_matcher {
      name = "routes"
      route_rule {
        priority = 1
        match_rule { prefix_match = "/" }
        origin = "test-origin"
        route_action {
          cors_policy {
            max_age       = "600s"
            allow_origins = ["https://media.example.com"]
          }
        }
      }
    }
  }
}
