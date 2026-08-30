resource "google_vertex_ai_index" "compliant_example_1" {
  display_name    = "compliant-index"
  region          = "us-central1"
  deletion_policy = "PREVENT"
}