# Compliant BigQuery Analytics Hub Listing Subscription
resource "google_bigquery_analytics_hub_listing_subscription" "compliant_sub" {
  location         = "US"
  data_exchange_id = "valid_exchange"
  listing_id       = "valid_listing"

  destination_dataset {
    friendly_name = "valid_dataset"
    description   = "Valid subscription dataset"
    location      = "US"
    labels = {
      env = "prod"
    }

    dataset_reference {
      dataset_id  = "valid_dataset_01"
      project_id  = "my-project"
    }
  }
}
