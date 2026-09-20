# google_compute_region_backend_service: deletion_policy
# Non-compliant when the resource can still be destroyed (DELETE, the default).

resource "google_compute_region_backend_service" "non_compliant_example_1" {
  name            = "non-compliant-example-1"
  deletion_policy = "DELETE"
}
