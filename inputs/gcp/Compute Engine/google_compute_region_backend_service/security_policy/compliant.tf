# google_compute_region_backend_service: security_policy
# Compliant when a Cloud Armor security policy is attached.

resource "google_compute_region_backend_service" "compliant_example_1" {
  name            = "compliant-example-1"
  security_policy = "https://www.googleapis.com/compute/v1/projects/fake-project/regions/australia-southeast1/securityPolicies/fake-policy"
}
