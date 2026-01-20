# google_bigquery_analytics_hub_listing_subscription (NON-COMPLIANT)
# This resource is non-compliant because destination_dataset.labels.environment is missing or empty

resource "google_bigquery_analytics_hub_data_exchange" "subscription_nc" {
  location         = "US"
  data_exchange_id = "my_data_exchange"
  display_name     = "my_data_exchange"
  description      = "Test Description"
}

resource "google_bigquery_dataset" "subscription_nc" {
  dataset_id    = "my_listing"
  friendly_name = "my_listing"
  description   = "Test Description"
  location      = "US"
}

resource "google_bigquery_analytics_hub_listing" "subscription_nc" {
  location         = "US"
  data_exchange_id = google_bigquery_analytics_hub_data_exchange.subscription_nc.data_exchange_id
  listing_id       = "my_listing"
  display_name     = "my_listing"
  description      = "Test Description"

  bigquery_dataset {
    dataset = google_bigquery_dataset.subscription_nc.id
  }
}

resource "google_bigquery_analytics_hub_listing_subscription" "nc" {
  location         = "US"
  data_exchange_id = google_bigquery_analytics_hub_data_exchange.subscription_nc.data_exchange_id
  listing_id       = google_bigquery_analytics_hub_listing.subscription_nc.listing_id

  destination_dataset {
    description   = "A non-compliant subscription"
    friendly_name = "Non-compliant dataset"
    location      = "US"

    labels = {
      testing = "123"
    }

    dataset_reference {
      dataset_id = "destination_dataset_noncompliant"
      project_id = google_bigquery_dataset.subscription_nc.project
    }
  }
}

