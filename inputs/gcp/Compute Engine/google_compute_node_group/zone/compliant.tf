# Compliant fixture: the node group is deployed in an approved zone.

resource "google_compute_node_group" "compliant_example_1" {
  name          = "node-group-zone-compliant"
  zone          = "australia-southeast1-a"
  node_template = "projects/example-project/regions/australia-southeast1/nodeTemplates/example-template"

  deletion_policy = "PREVENT"
}