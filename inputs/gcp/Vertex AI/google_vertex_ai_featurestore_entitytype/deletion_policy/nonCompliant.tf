resource "google_vertex_ai_featurestore_entitytype" "non_compliant_example_1" {
  name            = "non_compliant_example_1"
  featurestore    = "projects/12345/locations/us-central1/featurestores/fake-featurestore"
  deletion_policy = "DELETE"
}

resource "google_vertex_ai_featurestore_entitytype" "non_compliant_example_2" {
  name            = "non_compliant_example_2"
  featurestore    = "projects/12345/locations/us-central1/featurestores/fake-featurestore"
  # deletion_policy is omitted (defaults to DELETE)
}