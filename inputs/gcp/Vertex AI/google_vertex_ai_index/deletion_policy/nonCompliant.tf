resource "google_vertex_ai_index" "non_compliant_example_1" {
  display_name    = "non-compliant-index-1"
  region          = "us-central1"
  deletion_policy = "DELETE"
}

resource "google_vertex_ai_index" "non_compliant_example_2" {
  display_name    = "non-compliant-index-2"
  region          = "us-central1"
  deletion_policy = "ABANDON"
}

resource "google_vertex_ai_index" "non_compliant_example_3" {
  display_name = "non-compliant-index-3"
  region       = "us-central1"
  # deletion_policy is omitted (defaults to DELETE)
  
  metadata {
    config {
      dimensions = 2
    }
  }
}