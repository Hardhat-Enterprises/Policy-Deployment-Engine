resource "google_compute_node_template" "non_compliant_example_1" {
  name      = "non-compliant-example-1"
  project   = "PDE"
  region    = "us-central1"
  node_type = "n1-node-96-624"
}
