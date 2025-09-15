# Compliant BigQuery Analytics Hub Listing
resource "google_bigquery_analytics_hub_data_exchange" "c" {
  location         = "US"
  data_exchange_id = "compliant_exchange"
  display_name     = "de-compliant-exchange"
  description      = "Compliant data exchange"
}

resource "google_bigquery_analytics_hub_listing" "c" {
  location         = "US"
  data_exchange_id = google_bigquery_analytics_hub_data_exchange.c.data_exchange_id
  listing_id       = "valid_listing01"
  display_name     = "de-valid-listing"
  description      = "Compliant listing for testing"

  bigquery_dataset {
    dataset = "projects/myproject/datasets/compliant_dataset"
  }
}
