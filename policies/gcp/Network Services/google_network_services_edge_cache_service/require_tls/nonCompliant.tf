resource "google_network_services_edge_cache_service" "non_compliant_example_1" {
  name                  = "non_compliant_example_1"
  edge_ssl_certificates = ["projects/fake-project/global/sslCertificates/test-cert"]
  require_tls           = false
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
      }
    }
  }
}
