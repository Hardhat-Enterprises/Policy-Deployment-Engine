resource "google_bigquery_analytics_hub_data_exchange" "c_ex" {
  location         = "australia-southeast1"
  data_exchange_id = "c_exchange"
  display_name     = "c_exchange"
  description      = "compliant exchange"
}

resource "google_bigquery_dataset" "c_ds" {
  dataset_id    = "c_listing_ds"
  friendly_name = "c_listing_ds"
  description   = "dataset for compliant listing"
  location      = "australia-southeast1"
}

resource "google_bigquery_analytics_hub_listing" "c" {
  location         = "australia-southeast1"
  data_exchange_id = google_bigquery_analytics_hub_data_exchange.c_ex.data_exchange_id
  listing_id       = "c_listing"
  display_name     = "c_listing"
  description      = "compliant listing"

  restricted_export_config {
    enabled = true
  }

  bigquery_dataset {
    dataset = google_bigquery_dataset.c_ds.id
  }
}
