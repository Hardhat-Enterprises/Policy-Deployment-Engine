# Compliant fixture: sharing is restricted to the local project.

resource "google_compute_node_group" "compliant_example_1" {
  name          = "node-group-sharing-compliant"
  zone          = "australia-southeast1-a"
  node_template = "projects/example-project/regions/australia-southeast1/nodeTemplates/example-template"

  deletion_policy = "PREVENT"

  share_settings {
    share_type = "LOCAL"
  }
}