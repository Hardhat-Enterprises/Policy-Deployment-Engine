# google_compute_region_backend_service: failover_policy.drop_traffic_if_unhealthy
# Non-compliant when traffic is still sent (fail open) even though every backend is unhealthy.

resource "google_compute_region_backend_service" "non_compliant_example_1" {
  name = "non-compliant-example-1"

  failover_policy {
    drop_traffic_if_unhealthy = false
  }
}
