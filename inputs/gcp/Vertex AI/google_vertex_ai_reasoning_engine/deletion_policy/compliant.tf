resource "google_vertex_ai_reasoning_engine" "compliant_example_1" {
  display_name    = "compliant_example_1"
  region          = "australia-southeast1"
  deletion_policy = "PREVENT"
}