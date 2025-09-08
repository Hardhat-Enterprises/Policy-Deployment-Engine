resource "google_bigquery_analytics_hub_listing_subscription" "nc" {
  provider         = google-beta
  location         = "europe-west1"
  data_exchange_id = google_bigquery_analytics_hub_data_exchange.nc.data_exchange_id
  listing_id       = google_bigquery_analytics_hub_listing.nc.listing_id
  project          = "focus-dragon-406513-m2"

  destination_dataset {
    description   = "Bad subscription dataset"
    friendly_name = "badSubscription"
    labels = {
      environment = "unknown"
    }
    location = "europe-west1"
    dataset_reference {
      dataset_id = "bad_destination"
      project_id = "focus-dragon-406513-m2"
    }
  }
}
