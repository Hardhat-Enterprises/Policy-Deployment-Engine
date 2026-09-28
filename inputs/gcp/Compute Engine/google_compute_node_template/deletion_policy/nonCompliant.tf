resource "google_compute_node_template" "non_compliant_example_1" {
  name            = "non-compliant-example-1"
  project         = "PDE"
  region          = "australia-southeast1"
  node_type       = "n1-node-96-624"
  deletion_policy = "DELETE"
}
