resource "google_network_services_edge_cache_service" "compliant_example_1" {
  name            = "compliant_example_1"
  deletion_policy = "DELETE"

  routing {
    host_rule {
      hosts        = ["media.example.com"]
      path_matcher = "routes"
    }

    path_matcher {
      name = "routes"

      route_rule {
        priority = 1

        match_rule {
          prefix_match = "/"
        }

        origin = "test-origin"
      }
    }
  }
}
