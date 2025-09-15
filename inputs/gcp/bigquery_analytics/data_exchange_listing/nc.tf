# Non-compliant BigQuery Analytics Hub Listing
resource "google_bigquery_analytics_hub_data_exchange" "nc" {
  location         = "US"
  data_exchange_id = "bad_exchange"
  display_name     = "Invalid Exchange"
  description      = "Non-compliant data exchange"
}

resource "google_bigquery_analytics_hub_listing" "nc" {
  location         = "US"
  data_exchange_id = google_bigquery_analytics_hub_data_exchange.nc.data_exchange_id
  listing_id       = "Bad-Listing!"   # ❌ invalid characters (uppercase + special char)
  display_name     = "Invalid Listing" # ❌ does not start with 'de-'
  description      = "Non-compliant listing for testing"

  bigquery_dataset {
    dataset = "projects/myproject/datasets/noncompliant_dataset"
  }
}
