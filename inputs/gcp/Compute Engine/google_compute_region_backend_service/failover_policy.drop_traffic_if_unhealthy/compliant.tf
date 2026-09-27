# google_compute_region_backend_service: failover_policy.drop_traffic_if_unhealthy
# Compliant when traffic is dropped (fail closed) if every backend is unhealthy.

resource "google_compute_region_backend_service" "compliant_example_1" {
  name = "compliant-example-1"

  failover_policy {
    drop_traffic_if_unhealthy = true
  }
}
