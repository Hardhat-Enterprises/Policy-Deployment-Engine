resource "google_network_services_edge_cache_service" "non_compliant_example_1" {
  name = "non_compliant_example_1"
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
          cdn_policy {
            signed_request_mode   = "REQUIRE_TOKENS"
            signed_request_keyset = "projects/fake-project/global/edgeCacheKeysets/test-keyset"
            signed_token_options {
              allowed_signature_algorithms = ["HMAC_SHA1"]
            }
          }
        }
      }
    }
  }
}
