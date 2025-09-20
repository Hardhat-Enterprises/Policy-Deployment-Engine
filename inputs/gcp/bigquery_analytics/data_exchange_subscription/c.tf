# ✅ Compliant BigQuery Analytics Hub Data Exchange Subscription
resource "google_bigquery_analytics_hub_data_exchange_subscription" "c" {
  provider              = google-beta
  project               = "valid-project"
  location              = "us"
  data_exchange_project = "source-project"
  data_exchange_location= "us"
  data_exchange_id      = "valid_exchange"

  subscription_id    = "c"                        # ✅ short, compliant
  subscriber_contact = "validuser@example.com"    # ✅ valid email

  destination_dataset {
    location = "us"
    dataset_reference {
      project_id = "valid-project"
      dataset_id = "valid_dataset"
    }
    friendly_name = "Valid Dataset"
    description   = "This dataset is compliant"
    labels = {
      environment = "production"
      owner       = "team-x"
    }
  }

  refresh_policy = "ON_READ"
}
