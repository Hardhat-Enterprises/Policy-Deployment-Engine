resource "google_app_engine_service" "c" {
  project        = "my-project"
  service_id     = "internal-service"
  split {
    shard_by = "IP"
    allocations = {
      "v1" = 1.0
    }
  }
  ingress_traffic = "INGRESS_TRAFFIC_INTERNAL_ONLY"
}
