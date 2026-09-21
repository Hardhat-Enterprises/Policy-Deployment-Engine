resource "google_pubsub_topic" "non_compliant_example_1" {
  name = "non-compliant-example-1"
}

resource "google_bigquery_analytics_hub_listing" "non_compliant_example_1" {
  location         = "us"
  data_exchange_id = "c"
  listing_id       = "non_compliant_example_1"
  display_name     = "c"
  description      = "Non-compliant listing with data affinity outside the approved region"

  pubsub_topic {
    topic                 = google_pubsub_topic.non_compliant_example_1.id
    data_affinity_regions = ["asia-northeast1"]
  }
}
