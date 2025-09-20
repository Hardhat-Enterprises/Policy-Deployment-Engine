# ❌ Non-compliant BigQuery Analytics Hub Data Exchange Subscription #1
resource "google_bigquery_analytics_hub_data_exchange_subscription" "nc1" {
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

# ❌ Non-compliant Subscription #2
resource "google_bigquery_analytics_hub_data_exchange_subscription" "nc2" {
  provider              = google-beta
  project               = "another-bad-project"
  location              = "us"
  data_exchange_project = "source-project"
  data_exchange_location= "us"
  data_exchange_id      = "invalid_exchange2"

  subscription_id    = "NC_UpperCase"            # ❌ invalid (uppercase)
  subscriber_contact = "invalid@domain"          # ❌ invalid email

  destination_dataset {
    location = "us"
    dataset_reference {
      project_id = "another-bad-project"
      dataset_id = "another_bad_dataset"
    }
    friendly_name = "NonCompliant Dataset"
    description   = "This dataset fails policy"
    labels = {
      environment = ""   # ❌ empty label
    }
  }

  refresh_policy = "NEVER"   # ✅ valid Terraform value
}
