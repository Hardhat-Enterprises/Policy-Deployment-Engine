resource "google_compute_forwarding_rule" "non_compliant_example_1" {
  name                  = "non-compliant-example-1"
  region                = "us-central1"
  load_balancing_scheme = "EXTERNAL"
}
