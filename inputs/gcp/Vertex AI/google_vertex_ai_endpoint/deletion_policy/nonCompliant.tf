resource "google_vertex_ai_endpoint" "non_compliant_example_1" {
  name            = "endpoint-name"
  display_name    = "sample-endpoint"
  location        = "us-central1"
  deletion_policy = "DELETE"
}

resource "google_vertex_ai_endpoint" "non_compliant_example_2" {
  name            = "endpoint-name"
  display_name    = "sample-endpoint"
  location        = "us-central1"
  deletion_policy = "ABANDON"
}

resource "google_vertex_ai_endpoint" "non_compliant_example_3" {
  name         = "endpoint-name"
  display_name = "sample-endpoint"
  location     = "us-central1"
  # deletion_policy is omitted (defaults to DELETE)
}