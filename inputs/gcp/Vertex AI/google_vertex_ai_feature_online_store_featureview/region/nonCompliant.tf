resource "google_vertex_ai_feature_online_store_featureview" "non_compliant_example_1" {
  name                 = "non_compliant_example_1"
  region               = "europe-west1"
  feature_online_store = "fake-online-store"
  deletion_policy      = "PREVENT"
  sync_config {
    cron = "0 0 * * *"
  }
  big_query_source {
    uri               = "bq://fake.dataset.table"
    entity_id_columns = ["entity_id"]
  }
}
