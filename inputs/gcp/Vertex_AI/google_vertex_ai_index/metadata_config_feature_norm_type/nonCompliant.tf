resource "google_vertex_ai_index" "non_compliant_example_1" {
  display_name = "non-compliant-index-1"
  region       = "us-central1"
  
  metadata {
    config {
      dimensions        = 2
      feature_norm_type = ""
    }
  }
}