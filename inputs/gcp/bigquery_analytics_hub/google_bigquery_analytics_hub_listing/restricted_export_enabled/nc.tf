resource "google_bigquery_analytics_hub_data_exchange" "nc_ex" {
  location         = "australia-southeast1"
  data_exchange_id = "nc_exchange"
  display_name     = "nc_exchange"
  description      = "noncompliant exchange"
}

resource "google_bigquery_dataset" "nc_ds" {
  dataset_id    = "nc_listing_ds"
  friendly_name = "nc_listing_ds"
  description   = "dataset for noncompliant listing"
  location      = "australia-southeast1"
}

resource "google_bigquery_analytics_hub_listing" "nc" {
  location         = "australia-southeast1"
  data_exchange_id = google_bigquery_analytics_hub_data_exchange.nc_ex.data_exchange_id
  listing_id       = "nc_listing"
  display_name     = "nc_listing"
  description      = "noncompliant listing"

  restricted_export_config {
    enabled = false
  }

  bigquery_dataset {
    dataset = google_bigquery_dataset.nc_ds.id
  }
}
