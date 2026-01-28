# google_bigquery_analytics_hub_listing_subscription (COMPLIANT)
# destination_dataset.labels.environment is present and non-empty

resource "google_bigquery_analytics_hub_data_exchange" "c" {
  location         = "US"
  data_exchange_id = "c"
  display_name     = "c"
  description      = "Test Description"
}

resource "google_bigquery_dataset" "c" {
  dataset_id    = "c"
  friendly_name = "c"
  description   = "Test Description"
  location      = "US"
}

resource "google_bigquery_analytics_hub_listing" "c" {
  location         = "US"
  data_exchange_id = google_bigquery_analytics_hub_data_exchange.c.data_exchange_id
  listing_id       = "c"
  display_name     = "c"
  description      = "Test Description"

  bigquery_dataset {
    dataset = google_bigquery_dataset.c.id
  }
}

resource "google_bigquery_analytics_hub_listing_subscription" "c" {
  location         = "US"
  data_exchange_id = google_bigquery_analytics_hub_data_exchange.c.data_exchange_id
  listing_id       = google_bigquery_analytics_hub_listing.c.listing_id

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
      project_id = google_bigquery_dataset.c.project
    }
  }
}
