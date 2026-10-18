# google_compute_region_backend_service: security_policy
# Non-compliant when no Cloud Armor security policy is attached.

resource "google_compute_region_backend_service" "non_compliant_example_1" {
  name = "non-compliant-example-1"
}
