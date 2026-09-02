resource "google_vertex_ai_index" "non_compliant_example_1" {
  display_name = "sample-index"
  region       = ""

  metadata {
    config {
      dimensions = 2
    }
  }
}