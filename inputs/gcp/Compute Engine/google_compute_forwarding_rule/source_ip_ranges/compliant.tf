resource "google_compute_forwarding_rule" "compliant_example_1" {
  name              = "compliant-example-1"
  region            = "us-central1"
  load_balancing_scheme = "EXTERNAL"
  source_ip_ranges  = ["203.0.113.0/24"]
}
