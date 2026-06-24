resource "google_app_engine_service_network_settings" "nc" {
  project = "gcp-project-12345"
  service = "public-app"
  network_settings {
    ingress_traffic_allowed = "INGRESS_TRAFFIC_ALLOWED_ALL"
  }
}