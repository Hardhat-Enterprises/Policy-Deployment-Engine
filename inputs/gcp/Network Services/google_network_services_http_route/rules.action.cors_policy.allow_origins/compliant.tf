resource "google_network_services_http_route" "compliant_example_1" {
  name        = "compliant-example-1"
  hostnames   = ["example.com"]
  description = "Compliant HTTP route with an explicit, non-wildcard CORS origin list"

  rules {
    action {
      destinations {
        service_name = "projects/fake-project-id/locations/global/backendServices/fake-backend"
      }

      cors_policy {
        allow_origins = ["https://app.example.com"]
      }
    }
  }
}