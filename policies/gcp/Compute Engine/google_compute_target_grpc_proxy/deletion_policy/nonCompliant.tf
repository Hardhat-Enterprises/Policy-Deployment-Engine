resource "google_compute_target_grpc_proxy" "non_compliant_example_1" {
  name            = "non-compliant-example-1"
  deletion_policy = "ABANDON"
}
