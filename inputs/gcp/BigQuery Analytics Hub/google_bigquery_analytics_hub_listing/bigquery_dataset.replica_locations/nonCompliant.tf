resource "google_bigquery_analytics_hub_listing" "non_compliant_example_1" {
  location         = "us"
  data_exchange_id = "c"
  listing_id       = "non_compliant_example_1"
  display_name     = "c"
  description      = "Listing for replica_locations policy test"

  bigquery_dataset {
    dataset           = "projects/my-project/datasets/c"
    replica_locations = ["asia-northeast1"]
  }
}
