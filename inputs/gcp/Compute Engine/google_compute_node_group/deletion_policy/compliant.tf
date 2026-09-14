# Compliant fixture: the node group is protected against destructive Terraform deletion.

resource "google_compute_node_group" "compliant_example_1" {
  name          = "node-group-deletion-compliant"
  zone          = "australia-southeast1-a"
  node_template = "projects/example-project/regions/australia-southeast1/nodeTemplates/example-template"

  deletion_policy = "PREVENT"
}