resource "google_bigquery_analytics_hub_listing" "non_compliant_example_1" {
  location                    = "australia-southeast1"
  data_exchange_id            = "c"
  listing_id                  = "non_compliant_example_1"
  display_name                = "c"
  description                 = "Non-compliant public listing exposing full data, not just metadata"
  discovery_type               = "DISCOVERY_TYPE_PUBLIC"
  allow_only_metadata_sharing = false

  bigquery_dataset {
    dataset = "projects/my-project/datasets/c"
  }
}
