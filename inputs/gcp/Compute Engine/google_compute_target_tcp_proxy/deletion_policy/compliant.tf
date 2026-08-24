resource "google_compute_target_tcp_proxy" "compliant_example_1" {
  name            = "compliant_example_1"
  deletion_policy = "PREVENT"
}
