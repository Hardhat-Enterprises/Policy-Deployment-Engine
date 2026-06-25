# google_bigquery_analytics_hub_listing_subscription (COMPLIANT)
# destination_dataset.labels.environment is present and non-empty

resource "google_bigquery_analytics_hub_listing_subscription" "compliant_example_1" {
  location         = "US"
  data_exchange_id = "c"
  listing_id       = "compliant_example_1"

  destination_dataset {
    description   = "A compliant subscription"
    friendly_name = "Compliant dataset"
    location      = "US"

    labels = {
      environment = "dev"
      testing     = "123"
    }

    dataset_reference {
      dataset_id = "destination_dataset_compliant"
      project_id = "my-project"
    }
  }
}
