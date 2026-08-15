resource "google_network_services_http_route" "non_compliant_example_1" {
  name        = "non-compliant-example-1"
  hostnames   = ["example.com"]
  description = "Non-compliant HTTP route that rewrites the host to the cloud metadata endpoint"

  rules {
    action {
      url_rewrite {
        host_rewrite = "169.254.169.254"
      }
    }
  }
}