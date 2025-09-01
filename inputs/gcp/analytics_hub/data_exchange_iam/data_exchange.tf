resource "google_bigquery_analytics_hub_data_exchange" "data_exchange" {
  project         = "focus-dragon-406513-m2"        # Replace with your actual project ID
  location        = "us-central1"                   # Adjust the location as needed
  data_exchange_id = "compliant_example"           # Unique ID for the Data Exchange
  display_name     = "de-Compliant Exchange"       # Display name for the data exchange
  description      = "This is a description of the Data Exchange"
}
