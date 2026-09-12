resource "google_vertex_ai_feature_online_store" "non_compliant_example_1" {
  name   = "non_compliant_example_1"
  region = "australia-southeast1"

  bigtable {
    enable_direct_bigtable_access = true

    auto_scaling {
      min_node_count = 1
      max_node_count = 3
    }
  }
}