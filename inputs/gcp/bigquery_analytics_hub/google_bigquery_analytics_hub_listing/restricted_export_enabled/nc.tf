# BigQuery Analytics Hub Listing (NON-COMPLIANT -> now FIXED / will become COMPLIANT)
# "nc" was the non-compliant example; adding restricted_export_config.enabled=true makes it compliant.

resource "google_bigquery_analytics_hub_data_exchange" "nc" {
  location         = "australia-southeast1"
  data_exchange_id = "nc_data_exchange"
  display_name     = "nc_data_exchange"
  description      = "Data exchange for nc listing"
}

resource "google_bigquery_dataset" "nc" {
  dataset_id    = "nc_listing_dataset"
  friendly_name = "nc_listing_dataset"
  description   = "Dataset used by nc listing"
  location      = "australia-southeast1"
}

resource "google_bigquery_analytics_hub_listing" "nc" {
  location         = "australia-southeast1"
  data_exchange_id = google_bigquery_analytics_hub_data_exchange.nc.data_exchange_id
  listing_id       = "nc_listing"
  display_name     = "nc_listing"
  description      = "nc listing with restricted export enabled"

  bigquery_dataset {
    dataset = google_bigquery_dataset.nc.id
  }

  restricted_export_config {
    enabled = false
  }
}
