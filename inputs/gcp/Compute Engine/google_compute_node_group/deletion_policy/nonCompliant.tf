# Non-compliant fixture: Terraform is permitted to delete the node group.

resource "google_compute_node_group" "non_compliant_example_1" {
  name          = "node-group-deletion-non-compliant"
  zone          = "australia-southeast1-a"
  node_template = "projects/example-project/regions/australia-southeast1/nodeTemplates/example-template"

  deletion_policy = "DELETE"
}