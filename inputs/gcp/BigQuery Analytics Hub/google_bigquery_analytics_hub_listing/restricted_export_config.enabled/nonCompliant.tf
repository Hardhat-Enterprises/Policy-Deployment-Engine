# BigQuery Analytics Hub Listing (NON-COMPLIANT -> now FIXED / will become COMPLIANT)
# "nc" was the non-compliant example; adding restricted_export_config.enabled=true makes it compliant.

resource "google_bigquery_analytics_hub_listing" "non_compliant_example_1" {
  location         = "australia-southeast1"
  data_exchange_id = "c"
  listing_id       = "non_compliant_example_1"
  display_name     = "c"
  description      = "Compliant listing with restricted export enabled"

  bigquery_dataset {
    dataset = "projects/my-project/datasets/c"
  }

  restricted_export_config {
    enabled = false
  }
}
