resource "google_app_engine_service_network_settings" "nc" {
  service = "unapproved-service"

  network_settings {
    ingress_traffic_allowed = "INGRESS_TRAFFIC_ALLOWED_ALL"
  }
}
