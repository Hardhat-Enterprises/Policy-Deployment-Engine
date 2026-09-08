# google_bigquery_analytics_hub_listing_subscription (NON-COMPLIANT)
# This resource is non-compliant because destination_dataset.labels.environment is missing or empty

resource "google_bigquery_analytics_hub_listing_subscription" "non_compliant_example_1" {
  location         = "US"
  data_exchange_id = "c"
  listing_id       = "non_compliant_example_1"

  destination_dataset {
    description   = "A non-compliant subscription"
    friendly_name = "Non-compliant dataset"
    location      = "US"

    labels = {
      testing = "123"
    }

    dataset_reference {
      dataset_id = "destination_dataset_noncompliant"
      project_id = "my-project"
    }
  }
}
