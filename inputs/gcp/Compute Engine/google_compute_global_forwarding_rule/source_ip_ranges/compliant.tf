resource "google_compute_global_forwarding_rule" "compliant_example_1" {
  name    = "compliant-example-1"
  project = "test-project"
  target  = "https://www.googleapis.com/compute/v1/projects/fake-project/global/targetHttpProxies/fake-proxy"

  source_ip_ranges = ["203.0.113.0/24", "198.51.100.0/24"]
}
