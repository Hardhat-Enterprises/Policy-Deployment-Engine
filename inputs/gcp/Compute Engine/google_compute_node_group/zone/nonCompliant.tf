# Non-compliant fixture: the node group is deployed outside the approved zone baseline.

resource "google_compute_node_group" "non_compliant_example_1" {
  name          = "node-group-zone-non-compliant"
  zone          = "us-central1-a"
  node_template = "projects/example-project/regions/australia-southeast1/nodeTemplates/example-template"

  deletion_policy = "PREVENT"
}
