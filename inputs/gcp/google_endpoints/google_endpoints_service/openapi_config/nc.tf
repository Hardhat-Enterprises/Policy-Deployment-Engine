resource "google_endpoints_service" "nc" {
  project      = "my-project-12345"
  service_name = "nc"

  openapi_config = "http"
}