# google_compute_region_backend_service: deletion_policy
# Compliant when Terraform is blocked from destroying the resource (PREVENT).

resource "google_compute_region_backend_service" "compliant_example_1" {
  name            = "compliant-example-1"
  deletion_policy = "PREVENT"
}
