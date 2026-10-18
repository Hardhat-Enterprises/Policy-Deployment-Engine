resource "google_bigquery_analytics_hub_listing" "compliant_example_1" {
  location         = "us"
  data_exchange_id = "c"
  listing_id       = "compliant_example_1"
  display_name     = "c"
  description      = "Listing for data_affinity_regions policy test"

  pubsub_topic {
    topic                 = "projects/fake-project/topics/fake-topic"
    data_affinity_regions = ["us-central1"]
  }
}
