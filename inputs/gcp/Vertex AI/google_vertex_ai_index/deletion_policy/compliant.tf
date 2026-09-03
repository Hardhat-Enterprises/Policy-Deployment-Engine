resource "google_vertex_ai_index" "compliant_example_1" {
  display_name    = "sample-index"
  region          = "us-central1"
  deletion_policy = "PREVENT"
  
  metadata {
    config {
      dimensions = 2
    }
  }
}