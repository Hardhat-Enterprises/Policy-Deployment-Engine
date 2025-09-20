# Non-compliant resource 1 (nc1 = invalid display_name)
resource "google_bigquery_analytics_hub_data_exchange" "nc1" {
  data_exchange_id = "nc1"
  location         = "US"
  description      = "Non-compliant: display_name missing prefix"
  display_name     = "Invalid Name"            # ❌ does not start with de-
}

# Non-compliant resource 2 (nc2 = invalid data_exchange_id)
resource "google_bigquery_analytics_hub_data_exchange" "nc2" {
  data_exchange_id = "BadExample"              # ❌ uppercase letters
  location         = "US"
  description      = "Non-compliant: bad ID naming"
  display_name     = "de-Still Looks Okay"     # ✅ display_name is fine, ID fails
}
