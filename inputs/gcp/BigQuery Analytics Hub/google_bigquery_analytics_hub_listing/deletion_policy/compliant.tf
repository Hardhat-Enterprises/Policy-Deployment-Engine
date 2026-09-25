resource "google_bigquery_analytics_hub_listing" "compliant_example_1" {
  location         = "australia-southeast1"
  data_exchange_id = "c"
  listing_id       = "compliant_example_1"
  display_name     = "c"
  description      = "Compliant listing with deletion_policy set to PREVENT"
  deletion_policy  = "PREVENT"

  bigquery_dataset {
    dataset = "projects/my-project/datasets/c"
  }
}
