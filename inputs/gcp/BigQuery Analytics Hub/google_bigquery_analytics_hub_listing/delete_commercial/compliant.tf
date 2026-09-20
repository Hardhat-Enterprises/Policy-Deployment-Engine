resource "google_bigquery_analytics_hub_listing" "compliant_example_1" {
  location          = "australia-southeast1"
  data_exchange_id  = "c"
  listing_id        = "compliant_example_1"
  display_name      = "c"
  description       = "Compliant commercial listing with delete safeguard set"
  delete_commercial = true

  bigquery_dataset {
    dataset = "projects/my-project/datasets/c"
  }
}
