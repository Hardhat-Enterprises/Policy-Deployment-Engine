# Describe your resource type here

#license_config_subscription

resource "google_discovery_engine_license_config" "non_compliant_example_1" {
  project       = "735927692082"
  location = "eu"
  license_config_id = "non_compliant_example_1"
  license_count = 50
  subscription_tier = "SUBSCRIPTION_TIER_SEARCH_AND_ASSISTANT"

  start_date {
    year = 2099
    month = 1
    day = 1
  }
  end_date {
    year = 2100
    month = 1
    day = 1
  }
  subscription_term = "SUBSCRIPTION_TERM_ONE_YEAR"
}
