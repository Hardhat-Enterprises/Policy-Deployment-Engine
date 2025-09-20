# ❌ Non-compliant Data Exchange 1
resource "google_bigquery_analytics_hub_data_exchange" "nc1" {
  location         = "US"
  data_exchange_id = "bad_exchange1"
  display_name     = "Invalid Exchange"
  description      = "Non-compliant exchange for testing"
}

# ❌ Non-compliant Listing 1 – bad display_name
resource "google_bigquery_analytics_hub_listing" "nc1" {
  location         = "US"
  data_exchange_id = google_bigquery_analytics_hub_data_exchange.nc1.data_exchange_id
  listing_id       = "nc1"
  display_name     = "Invalid Listing" # ❌ does not start with 'de-'
  description      = "Non-compliant listing 1 (bad display_name)"

  bigquery_dataset {
    dataset = "projects/myproject/datasets/noncompliant_dataset1"
  }
}

# ❌ Non-compliant Data Exchange 2
resource "google_bigquery_analytics_hub_data_exchange" "nc2" {
  location         = "US"
  data_exchange_id = "bad_exchange2"
  display_name     = "de-bad-exchange"
  description      = "Non-compliant exchange for testing"
}

# ❌ Non-compliant Listing 2 – bad listing_id
resource "google_bigquery_analytics_hub_listing" "nc2" {
  location         = "US"
  data_exchange_id = google_bigquery_analytics_hub_data_exchange.nc2.data_exchange_id
  listing_id       = "Bad-Listing!"   # ❌ invalid chars
  display_name     = "de-valid-listing"
  description      = "Non-compliant listing 2 (bad listing_id)"

  bigquery_dataset {
    dataset = "projects/myproject/datasets/noncompliant_dataset2"
  }
}
