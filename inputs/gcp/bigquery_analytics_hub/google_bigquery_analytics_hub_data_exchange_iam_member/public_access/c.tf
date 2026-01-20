# BigQuery Analytics Hub Data Exchange IAM Member (COMPLIANT)
# Compliant because member is NOT public (not allUsers / allAuthenticatedUsers)

resource "google_bigquery_analytics_hub_data_exchange_iam_member" "c" {
  project         = "my-project-id"
  location        = "us"
  data_exchange_id = "my_data_exchange_id"

  role   = "roles/viewer"
  member = "user:jane@example.com"
}
