resource "google_network_services_edge_cache_service" "non_compliant_example_1" {
  name                  = "non_compliant_example_1"
  edge_ssl_certificates = ["projects/fake-project/global/sslCertificates/test-cert"]
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
        url_redirect {
          https_redirect = false
        }
      }
    }
  }
}

resource "google_network_services_edge_cache_service" "non_compliant_example_2" {
  name                  = "non_compliant_example_2"
  edge_ssl_certificates = ["projects/fake-project/global/sslCertificates/test-cert"]
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
        url_redirect {
          host_redirect = "redirect.example.com"
        }
      }
    }
  }
}
