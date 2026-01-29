# BigQuery Analytics Hub Listing (COMPLIANT)
# Keep "c" as the name to indicate that this resource and its attributes are compliant

resource "google_bigquery_analytics_hub_data_exchange" "c" {
  location         = "australia-southeast1"
  data_exchange_id = "c"
  display_name     = "c"
  description      = "Compliant data exchange for listing"
}

resource "google_bigquery_dataset" "c" {
  dataset_id    = "c"
  friendly_name = "c"
  description   = "Dataset used by compliant listing"
  location      = "australia-southeast1"
}

resource "google_bigquery_analytics_hub_listing" "c" {
  location         = "australia-southeast1"
  data_exchange_id = google_bigquery_analytics_hub_data_exchange.c.data_exchange_id
  listing_id       = "c"
  display_name     = "c"
  description      = "Compliant listing with restricted export enabled"

  bigquery_dataset {
    dataset = google_bigquery_dataset.c.id
  }

  restricted_export_config {
    enabled               = true
    restrict_query_result = true
  }
}
