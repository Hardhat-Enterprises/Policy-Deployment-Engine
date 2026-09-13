
resource "google_vertex_ai_feature_online_store_featureview" "non_compliant_example_1" {
  name                 = "non_compliant_example_1"
  region               = "australia-southeast1"
  feature_online_store = "fake-online-store"
  deletion_policy      = "DELETE"
}

resource "google_vertex_ai_feature_online_store_featureview" "non_compliant_example_2" {
  name                 = "non_compliant_example_2"
  region               = "australia-southeast1"
  feature_online_store = "fake-online-store"
  
  # deletion_policy is omitted (defaults to DELETE)
}