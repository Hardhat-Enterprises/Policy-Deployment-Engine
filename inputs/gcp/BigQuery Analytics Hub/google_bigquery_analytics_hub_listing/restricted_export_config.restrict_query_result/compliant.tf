resource "google_bigquery_analytics_hub_listing" "compliant_example_1" {
  location         = "australia-southeast1"
  data_exchange_id = "c"
  listing_id       = "compliant_example_1"
  display_name     = "c"
  description      = "Compliant listing restricting export of derived query results"

  bigquery_dataset {
    dataset = "projects/my-project/datasets/c"
  }

  restricted_export_config {
    enabled               = true
    restrict_query_result = true
  }
}
