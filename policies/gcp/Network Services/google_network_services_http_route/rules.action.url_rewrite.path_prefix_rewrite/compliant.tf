resource "google_network_services_http_route" "compliant_example_1" {
  name        = "compliant-example-1"
  hostnames   = ["example.com"]

  rules {
    action {
      url_rewrite {
        path_prefix_rewrite = "/api/v1/"
      }
    }
  }
}