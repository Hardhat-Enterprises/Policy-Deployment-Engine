resource "google_compute_target_grpc_proxy" "compliant_example_1" {
  name            = "compliant-example-1"
  deletion_policy = "PREVENT"
}
