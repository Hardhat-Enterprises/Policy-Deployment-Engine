resource "google_vertex_ai_index" "compliant_example_1" {
  display_name = "sample-index"
  region       = "us-central1"
  
  metadata {
    config {
      dimensions            = 2
      distance_measure_type = "COSINE_DISTANCE"
    }
  }
}