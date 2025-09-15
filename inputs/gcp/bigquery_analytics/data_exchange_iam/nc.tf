# Non-compliant BigQuery Analytics Hub Data Exchange IAM Binding
resource "google_bigquery_analytics_hub_data_exchange_iam_binding" "nc" {
  project          = "my-sample-project"
  location         = "US"
  data_exchange_id = "bad_exchange"
  role             = "roles/owner" # ❌ risky role
  members = [
    "allUsers", # ❌ risky member
  ]
}
