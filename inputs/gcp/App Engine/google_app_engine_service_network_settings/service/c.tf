resource "google_app_engine_service_network_settings" "c" {
  project = "gcp-project-12345"
  service = "app-internal-service"
  network_settings {
    ingress_traffic_allowed = "INGRESS_TRAFFIC_ALLOWED_INTERNAL_ONLY"
  }
}