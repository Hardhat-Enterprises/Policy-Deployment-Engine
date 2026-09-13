resource "google_vertex_ai_feature_online_store_featureview" "compliant_example_1" {
  name                 = "compliant_example_1"
  region               = "australia-southeast1"
  feature_online_store = "fake-online-store"
  deletion_policy      = "PREVENT"
}