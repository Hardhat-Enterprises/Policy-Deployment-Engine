# Non-Compliant BigQuery Analytics Hub Listing Subscription #1
resource "google_bigquery_analytics_hub_listing_subscription" "nc1" {
  location         = "US"
  data_exchange_id = "bad_exchange"
  listing_id       = "nc1"   # ❌ ID should not start with "nc"

  destination_dataset {
    friendly_name = "👋"             # ❌ Invalid (emoji not allowed)
    description   = "Bad subscription dataset"
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

# Non-Compliant BigQuery Analytics Hub Listing Subscription #2
resource "google_bigquery_analytics_hub_listing_subscription" "nc2" {
  location         = "US"
  data_exchange_id = "invalid_exchange"
  listing_id       = "nc2"   # ❌ Not compliant, ID must be lowercase/underscores only

  destination_dataset {
    friendly_name = "Invalid@Name"   # ❌ Invalid character "@"
    description   = "Another bad subscription dataset"
    location      = "US"
    labels = {}   # ❌ Missing required labels (e.g., env/owner)

    dataset_reference {
      dataset_id  = "wrong*dataset"  # ❌ Invalid "*"
      project_id  = "my-project"
    }
  }
}
