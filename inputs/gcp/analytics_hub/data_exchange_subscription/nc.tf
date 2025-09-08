resource "google_bigquery_analytics_hub_data_exchange_subscription" "nc" {
  provider              = google-beta
  project               = "subscriber-project"
  location              = "europe-west1" # ❌ Not allowed

  data_exchange_project  = "publisher-project"
  data_exchange_location = "europe-west1" # ❌ mismatch
  data_exchange_id       = "Bad*Exchange!" # ❌ invalid chars

  subscription_id    = "Bad Subscription!" # ❌ invalid ID
  subscriber_contact = "invalid-email"     # ❌ invalid email

  destination_dataset {
    location = "europe-west1"

    dataset_reference {
      project_id = "subscriber-project"
      dataset_id = "Invalid Dataset ID!" # ❌ invalid chars
    }
    friendly_name = ""
    description   = ""
  }

  refresh_policy = "NEVER" # ❌ does not keep subscription in sync
}
