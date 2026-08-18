resource "google_bigquery_row_access_policy" "compliant_example_1" {
  project = "PDE"  
  dataset_id        = "compliant_example_1"
  table_id          = "my_table"
  policy_id         = "my_policy"
  filter_predicate  = "region='australia-southeast1'"
}
