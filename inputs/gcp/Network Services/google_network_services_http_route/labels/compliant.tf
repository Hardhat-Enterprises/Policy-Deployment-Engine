resource "google_network_services_http_route" "compliant_example_1" {
  name        = "compliant-example-1"
  hostnames   = ["example.com"]
  description = "Compliant HTTP route with baseline labels"

  labels = {
    environment = "production"
    owner       = "network-team"
  }

  rules {
    action {
      destinations {
        service_name = "projects/fake-project-id/locations/global/backendServices/fake-backend"
      }
    }
  }
}