resource "google_vertex_ai_featurestore_entitytype" "compliant_example_1" {
  name            = "compliant_example_1"
  featurestore    = "projects/12345/locations/us-central1/featurestores/fake-featurestore"
  deletion_policy = "PREVENT"
  
  monitoring_config {
    snapshot_analysis {
      disabled = false
    }
  }
}