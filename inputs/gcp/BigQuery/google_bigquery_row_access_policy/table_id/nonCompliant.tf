resource "google_bigquery_row_access_policy" "non_compliant_example_1" {
  project = "PDE"  
  dataset_id        = "non_compliant_example_1"
  table_id          = "invalid"
  policy_id         = "my_policy"
  filter_predicate  = "region='EU'"
}
