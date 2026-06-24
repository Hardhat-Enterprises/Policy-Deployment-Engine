# google_bigquery_analytics_hub_listing_subscription (NON-COMPLIANT)
# This resource is non-compliant because destination_dataset.labels.environment is missing or empty

resource "google_bigquery_analytics_hub_data_exchange" "nc" {
  location         = "US"
  data_exchange_id = "nc"
  display_name     = "nc"
  description      = "Test Description"
}

resource "google_bigquery_dataset" "nc" {
  dataset_id    = "nc"
  friendly_name = "nc"
  description   = "Test Description"
  location      = "US"
}

resource "google_bigquery_analytics_hub_listing" "nc" {
  location         = "US"
  data_exchange_id = google_bigquery_analytics_hub_data_exchange.nc.data_exchange_id
  listing_id       = "nc"
  display_name     = "nc"
  description      = "Test Description"

  bigquery_dataset {
    dataset = google_bigquery_dataset.nc.id
  }
}

resource "google_bigquery_analytics_hub_listing_subscription" "nc" {
  location         = "US"
  data_exchange_id = google_bigquery_analytics_hub_data_exchange.nc.data_exchange_id
  listing_id       = google_bigquery_analytics_hub_listing.nc.listing_id

  destination_dataset {
    description   = "A non-compliant subscription"
    friendly_name = "Non-compliant dataset"
    location      = "US"

    labels = {
      testing = "123"
    }

    dataset_reference {
      dataset_id = "destination_dataset_noncompliant"
      project_id = google_bigquery_dataset.nc.project
    }
  }
}
