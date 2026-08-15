resource "google_network_services_http_route" "non_compliant_example_1" {
  name        = "non-compliant-example-1"
  hostnames   = ["example.com"]
  description = "Non-compliant HTTP route that rewrites the path to a bare traversal sequence"

  rules {
    action {
      url_rewrite {
        path_prefix_rewrite = ".."
      }
    }
  }
}