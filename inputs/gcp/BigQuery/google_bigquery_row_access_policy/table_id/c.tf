resource "google_bigquery_row_access_policy" "c" {
  project          = "PDE"
  dataset_id       = "c"
  table_id         = "my_table"
  policy_id        = "my_policy"
  filter_predicate = "region='australia-southeast1'"
}