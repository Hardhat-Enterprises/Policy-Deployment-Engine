resource "google_bigquery_analytics_hub_listing" "compliant_example_1" {
  location                            = "australia-southeast1"
  data_exchange_id                    = "c"
  listing_id                          = "compliant_example_1"
  display_name                        = "c"
  description                         = "Compliant listing with subscriber query logging enabled"
  log_linked_dataset_query_user_email = true

  bigquery_dataset {
    dataset = "projects/my-project/datasets/c"
  }
}
