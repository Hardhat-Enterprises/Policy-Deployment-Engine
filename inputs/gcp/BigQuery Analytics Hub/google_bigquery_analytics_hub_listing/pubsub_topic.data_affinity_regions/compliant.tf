resource "google_pubsub_topic" "compliant_example_1" {
  name = "compliant-example-1"
}

resource "google_bigquery_analytics_hub_listing" "compliant_example_1" {
  location         = "us"
  data_exchange_id = "c"
  listing_id       = "compliant_example_1"
  display_name     = "c"
  description      = "Compliant listing with data affinity restricted to an approved region"

  pubsub_topic {
    topic                 = google_pubsub_topic.compliant_example_1.id
    data_affinity_regions = ["us-central1"]
  }
}
