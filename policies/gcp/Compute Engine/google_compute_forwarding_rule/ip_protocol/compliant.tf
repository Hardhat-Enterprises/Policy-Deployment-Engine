resource "google_compute_forwarding_rule" "compliant_example_1" {
  name        = "compliant-example-1"
  region      = "us-central1"
  ip_protocol = "TCP"
}
