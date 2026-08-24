resource "google_compute_target_tcp_proxy" "non_compliant_example_1" {
  name            = "non_compliant_example_1"
  deletion_policy = "ABANDON"
}
