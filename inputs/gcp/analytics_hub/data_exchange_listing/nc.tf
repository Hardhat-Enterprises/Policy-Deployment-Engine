resource "google_bigquery_analytics_hub_data_exchange" "listing_bad" {
  location         = "US"
  data_exchange_id = "bad_data_exchange"
  display_name     = "de-bad_data_exchange"
  description      = "bad example exchange"
}

resource "google_bigquery_analytics_hub_listing" "listing_bad" {
  location         = "US"
  data_exchange_id = google_bigquery_analytics_hub_data_exchange.listing_bad.data_exchange_id
  listing_id       = "bad_listing"
  display_name     = "wrongName"   # ❌ violates prefix policy
  description      = "non-compliant listing"
  
  bigquery_dataset {
    dataset = google_bigquery_dataset.listing_bad.id
  }
}

resource "google_bigquery_dataset" "listing_bad" {
  dataset_id    = "bad_listing_ds"
  friendly_name = "bad_listing_ds"
  description   = "dataset for non-compliant listing"
  location      = "US"
}
