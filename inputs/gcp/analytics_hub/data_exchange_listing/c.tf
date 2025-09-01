resource "google_bigquery_analytics_hub_data_exchange" "listing_good" {
  location         = "US"
  data_exchange_id = "my_data_exchange"
  display_name     = "de-my_data_exchange"
  description      = "example data exchange"
}

resource "google_bigquery_analytics_hub_listing" "listing_good" {
  location         = "US"
  data_exchange_id = google_bigquery_analytics_hub_data_exchange.listing_good.data_exchange_id
  listing_id       = "list_good"
  display_name     = "list-good"
  description      = "compliant listing"
  
  bigquery_dataset {
    dataset = google_bigquery_dataset.listing_good.id
  }
}

resource "google_bigquery_dataset" "listing_good" {
  dataset_id    = "list_good_ds"
  friendly_name = "list_good_ds"
  description   = "dataset for compliant listing"
  location      = "US"
}
