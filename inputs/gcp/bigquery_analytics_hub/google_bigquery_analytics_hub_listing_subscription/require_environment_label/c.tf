# google_bigquery_analytics_hub_listing_subscription (COMPLIANT)
# destination_dataset.labels.environment is present and non-empty

resource "google_bigquery_analytics_hub_data_exchange" "subscription" {
  location         = "US"
  data_exchange_id = "my_data_exchange"
  display_name     = "my_data_exchange"
  description      = "Test Description"
}

resource "google_bigquery_dataset" "subscription" {
  dataset_id    = "my_listing"
  friendly_name = "my_listing"
  description   = "Test Description"
  location      = "US"
}

resource "google_bigquery_analytics_hub_listing" "subscription" {
  location         = "US"
  data_exchange_id = google_bigquery_analytics_hub_data_exchange.subscription.data_exchange_id
  listing_id       = "my_listing"
  display_name     = "my_listing"
  description      = "Test Description"

  bigquery_dataset {
    dataset = google_bigquery_dataset.subscription.id
  }
}

resource "google_bigquery_analytics_hub_listing_subscription" "c" {
  location         = "US"
  data_exchange_id = google_bigquery_analytics_hub_data_exchange.subscription.data_exchange_id
  listing_id       = google_bigquery_analytics_hub_listing.subscription.listing_id

  destination_dataset {
    description   = "A compliant subscription"
    friendly_name = "Compliant dataset"
    location      = "US"

    labels = {
      environment = "dev"
      testing     = "123"
    }

    dataset_reference {
      dataset_id = "destination_dataset_compliant"
      project_id = google_bigquery_dataset.subscription.project
    }
  }
}
