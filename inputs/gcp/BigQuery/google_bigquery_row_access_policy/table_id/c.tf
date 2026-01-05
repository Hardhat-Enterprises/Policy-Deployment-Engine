resource "google_bigquery_row_access_policy" "c" {
  project = "example-project"  
  dataset_id        = "c"
  table_id          = "my_table"
  policy_id         = "my_policy"
  filter_predicate  = "region='australia-southeast1'"
}