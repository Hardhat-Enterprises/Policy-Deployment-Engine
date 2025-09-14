resource "google_app_engine_service_network_settings" "nc" {
  service = "insecure-service-nc"
  network_settings {
    ingress_traffic_allowed = "INGRESS_TRAFFIC_ALLOWED_ALL"
  }
}
