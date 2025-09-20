# Compliant resource (c = compliant)
resource "google_bigquery_analytics_hub_data_exchange" "c" {
  data_exchange_id = "c"                       # ✅ short and compliant
  location         = "US"
  description      = "Compliant data exchange"
  display_name     = "de-Compliant Exchange"   # ✅ starts with de-
}
