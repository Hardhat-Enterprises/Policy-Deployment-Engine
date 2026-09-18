resource "google_vertex_ai_featurestore_entitytype" "non_compliant_example_1" {
  name            = "non_compliant_example_1"
  featurestore    = "projects/12345/locations/us-central1/featurestores/fake-featurestore"
  deletion_policy = "PREVENT"
  
  monitoring_config {
    import_features_analysis {
      state = "DISABLED"
    }
  }
}

resource "google_vertex_ai_featurestore_entitytype" "non_compliant_example_2" {
  name            = "non_compliant_example_2"
  featurestore    = "projects/12345/locations/us-central1/featurestores/fake-featurestore"
  deletion_policy = "PREVENT"
  
  monitoring_config {
    import_features_analysis {
      state = "DEFAULT"
    }
  }
}

resource "google_vertex_ai_featurestore_entitytype" "non_compliant_example_3" {
  name            = "non_compliant_example_3"
  featurestore    = "projects/12345/locations/us-central1/featurestores/fake-featurestore"
  deletion_policy = "PREVENT"
  # monitoring_config is entirely omitted
}