resource "google_bigquery_analytics_hub_listing" "non_compliant_example_1" {
  location          = "australia-southeast1"
  data_exchange_id  = "c"
  listing_id        = "non_compliant_example_1"
  display_name      = "c"
  description       = "Non-compliant listing that pre-authorizes deletion, bypassing the guard"
  delete_commercial = true

  bigquery_dataset {
    dataset = "projects/my-project/datasets/c"
  }
}
