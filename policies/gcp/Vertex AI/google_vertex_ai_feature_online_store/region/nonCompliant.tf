resource "google_vertex_ai_feature_online_store" "non_compliant_example_1" {
  name   = "non_compliant_example_1"
  region = "us-central1"

  optimized {}
}