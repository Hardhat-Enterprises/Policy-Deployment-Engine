resource "google_bigquery_analytics_hub_data_exchange_subscription" "c" {
  provider              = google-beta
  project               = "subscriber-project"
  location              = "us"

  data_exchange_project  = "publisher-project"
  data_exchange_location = "us"
  data_exchange_id       = "valid_data_exchange"

  subscription_id    = "subscribed_dataset"
  subscriber_contact = "subscriber@example.com"

  destination_dataset {
    location = "us"

    dataset_reference {
      project_id = "subscriber-project"
      dataset_id = "subscribed_dest_dataset"
    }
    friendly_name = "Subscribed Destination Dataset"
    description   = "Destination dataset for subscription"
    labels = {
      environment = "development"
      owner       = "team-a"
    }
  }

  refresh_policy = "ON_READ"
}
