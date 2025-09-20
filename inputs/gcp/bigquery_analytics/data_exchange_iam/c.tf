# Compliant BigQuery Analytics Hub Data Exchange IAM Binding
resource "google_bigquery_analytics_hub_data_exchange_iam_binding" "c" {
  project          = "my-sample-project"
  location         = "US"
  data_exchange_id = "compliant_exchange"
  role             = "roles/viewer"

  members = [
    "user:jane@example.com",  # ✅ valid user
  ]
}
