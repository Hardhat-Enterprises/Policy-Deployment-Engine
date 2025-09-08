resource "google_bigquery_analytics_hub_listing_subscription" "subscription" {
  provider         = google-beta
  location         = "US"
  data_exchange_id = google_bigquery_analytics_hub_data_exchange.subscription.data_exchange_id
  listing_id       = google_bigquery_analytics_hub_listing.subscription.listing_id
  project          = "focus-dragon-406513-m2"

  destination_dataset {
    description   = "Compliant subscription dataset"
    friendly_name = "compliant_subscription"
    labels = {
      environment = "dev"
    }
    location = "US"
    dataset_reference {
      dataset_id = "compliant_destination_dataset"
      project_id = "focus-dragon-406513-m2"
    }
  }
}
