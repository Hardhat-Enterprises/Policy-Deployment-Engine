resource "google_compute_global_forwarding_rule" "non_compliant_example_1" {
  name             = "non-compliant-example-1"
  project          = "test-project"
  target           = "https://www.googleapis.com/compute/v1/projects/fake-project/global/targetHttpProxies/fake-proxy"
  deletion_policy  = "DELETE"
}
