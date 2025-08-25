resource "google_app_engine_service_network_settings" "c" {
  service = "secure-service-c"
  network_settings {
    ingress_traffic_allowed = "INGRESS_TRAFFIC_ALLOWED_INTERNAL_ONLY"
  }
}
