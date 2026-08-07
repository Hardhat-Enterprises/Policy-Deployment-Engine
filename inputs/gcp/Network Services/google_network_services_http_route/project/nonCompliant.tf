resource "google_network_services_http_route" "non_compliant_example_1" {
  name        = "non-compliant-example-1"
  hostnames   = ["example.com"]
  description = "Non-compliant HTTP route with no project pinned"

  rules {
    action {
      destinations {
        service_name = "projects/fake-project-id/locations/global/backendServices/fake-backend"
      }
    }
  }
}