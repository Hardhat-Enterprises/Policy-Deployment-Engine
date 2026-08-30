resource "google_vertex_ai_index" "compliant_example_1" {
  display_name = "compliant-index"
  region       = "us-central1"
  
  metadata {
    config {
      dimensions        = 2
      feature_norm_type = "UNIT_L2_NORM"
    }
  }
}