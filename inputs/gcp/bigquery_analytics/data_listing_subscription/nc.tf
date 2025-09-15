# Non-Compliant BigQuery Analytics Hub Listing Subscription
resource "google_bigquery_analytics_hub_listing_subscription" "bad_sub" {
  location         = "US"
  data_exchange_id = "bad_exchange"
  listing_id       = "bad_listing"

  destination_dataset {
    friendly_name = "👋"             # ❌ Invalid (emoji not allowed)
    description   = "Test subscription dataset"
    location      = "US"
    labels = {
      testing = "123"
    }

    dataset_reference {
      dataset_id  = "bad-dataset$"   # ❌ Invalid (dash + $)
      project_id  = "my-project"
    }
  }
}
