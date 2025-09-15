resource "google_bigquery_analytics_hub_data_exchange_subscription" "nc" {
  provider              = google-beta
  project               = "bad-project"
  location              = "us"
  data_exchange_project = "source-project"
  data_exchange_location= "us"
  data_exchange_id      = "invalid_exchange"

  subscription_id    = "Bad-Subscription!"   # ❌ Invalid chars
  subscriber_contact = "not-an-email"        # ❌ Invalid email

  destination_dataset {
    location = "us"
    dataset_reference {
      project_id = "bad-project"
      dataset_id = "bad_dataset"
    }
    friendly_name = "Bad Dataset"
    description   = "This dataset is non-compliant"
    labels = {}   # ❌ Missing required labels
  }

  refresh_policy = "NEVER"
}
