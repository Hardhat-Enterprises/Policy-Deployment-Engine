resource "google_network_services_http_route" "non_compliant_example_1" {
  name        = "non-compliant-example-1"
  hostnames   = ["example.com"]

  rules {
    action {
      destinations {
        service_name = "projects/fake-project-id/locations/global/backendServices/fake-backend"
      }

      cors_policy {
        allow_origin_regexes = ["https://.*\\.example\\.com"]
      }
    }
  }
}