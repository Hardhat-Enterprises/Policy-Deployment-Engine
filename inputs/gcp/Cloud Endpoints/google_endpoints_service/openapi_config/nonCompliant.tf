resource "google_endpoints_service" "non_compliant_example_1" {
  project      = "my-project-12345"
  service_name = "nc"

  openapi_config = "http"
}
