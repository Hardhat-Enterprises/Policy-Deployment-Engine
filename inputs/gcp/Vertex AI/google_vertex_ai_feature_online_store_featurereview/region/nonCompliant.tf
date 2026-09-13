resource "google_vertex_ai_feature_online_store_featureview" "non_compliant_example_1" {
  name                 = "non_compliant_example_1"
  region               = "europe-west1"
  feature_online_store = "fake-online-store"
  deletion_policy      = "PREVENT"
}