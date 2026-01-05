resource "google_bigquery_row_access_policy" "nc" {
  project = "example-project"  
  dataset_id        = "nc"
  table_id          = "my_table"
  policy_id         = "my_policy"
  filter_predicate  = "region='EU'"
    grantees = [
    "allUsers"
  ]
}