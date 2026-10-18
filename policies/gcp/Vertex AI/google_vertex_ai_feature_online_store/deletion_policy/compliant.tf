resource "google_vertex_ai_feature_online_store" "compliant_example_1" {
  name            = "compliant_example_1"
  region          = "australia-southeast1"
  deletion_policy = "PREVENT"

  optimized {}
}