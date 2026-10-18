resource "google_vertex_ai_index" "non_compliant_example_1" {
  display_name    = "sample-index"
  region          = "us-central1"
  deletion_policy = "DELETE"

  metadata {
    config {
      dimensions = 2
    }
  }
}

resource "google_vertex_ai_index" "non_compliant_example_2" {
  display_name    = "sample-index"
  region          = "us-central1"
  deletion_policy = "ABANDON"

  metadata {
    config {
      dimensions = 2
    }
  }
}

resource "google_vertex_ai_index" "non_compliant_example_3" {
  display_name = "sample-index"
  region       = "us-central1"
  # deletion_policy is omitted (defaults to DELETE)

  metadata {
    config {
      dimensions = 2
    }
  }
}