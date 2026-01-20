# BigQuery Analytics Hub Data Exchange IAM Member (NON-COMPLIANT)
# Non-compliant because member is public (allUsers / allAuthenticatedUsers)

resource "google_bigquery_analytics_hub_data_exchange_iam_member" "nc" {
  project         = "my-project-id"
  location        = "us"
  data_exchange_id = "my_data_exchange_id"

  role   = "roles/viewer"
  member = "allUsers"
}
