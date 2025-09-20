# ✅ Compliant Data Exchange 1
resource "google_bigquery_analytics_hub_data_exchange" "c1" {
  location         = "US"
  data_exchange_id = "compliant_exchange1"
  display_name     = "de-compliant-exchange1"
  description      = "Compliant data exchange 1"
}

# ✅ Compliant Listing 1
resource "google_bigquery_analytics_hub_listing" "c1" {
  location         = "US"
  data_exchange_id = google_bigquery_analytics_hub_data_exchange.c1.data_exchange_id
  listing_id       = "c1"
  display_name     = "de-valid-listing1"
  description      = "Compliant listing 1 for testing"

  bigquery_dataset {
    dataset = "projects/myproject/datasets/compliant_dataset1"
  }
}

# ✅ Compliant Data Exchange 2
resource "google_bigquery_analytics_hub_data_exchange" "c2" {
  location         = "US"
  data_exchange_id = "compliant_exchange2"
  display_name     = "de-compliant-exchange2"
  description      = "Compliant data exchange 2"
}

# ✅ Compliant Listing 2
resource "google_bigquery_analytics_hub_listing" "c2" {
  location         = "US"
  data_exchange_id = google_bigquery_analytics_hub_data_exchange.c2.data_exchange_id
  listing_id       = "c2"
  display_name     = "de-valid-listing2"
  description      = "Compliant listing 2 for testing"

  bigquery_dataset {
    dataset = "projects/myproject/datasets/compliant_dataset2"
  }
}
