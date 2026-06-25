resource "google_endpoints_service" "compliant_example_1" {
  project      = "my-project-12345"
  service_name = "c"

  openapi_config = "https"
}
