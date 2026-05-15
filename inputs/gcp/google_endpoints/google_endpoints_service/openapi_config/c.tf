resource "google_endpoints_service" "c" {
  project      = "my-project-12345"
  service_name = "c"

  openapi_config = "https"
}