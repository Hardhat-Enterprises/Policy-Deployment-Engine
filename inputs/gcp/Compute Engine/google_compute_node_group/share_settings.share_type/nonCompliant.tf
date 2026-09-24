# Non-compliant fixture: the node group is shared across the entire organisation.

resource "google_compute_node_group" "non_compliant_example_1" {
  name          = "node-group-sharing-non-compliant"
  zone          = "australia-southeast1-a"
  node_template = "projects/example-project/regions/australia-southeast1/nodeTemplates/example-template"

  deletion_policy = "PREVENT"

  share_settings {
    share_type = "ORGANIZATION"
  }
}