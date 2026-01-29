# BigQuery Analytics Hub Data Exchange IAM Member (NON-COMPLIANT)
# Non-compliant because member is public (allUsers / allAuthenticatedUsers)

resource "google_bigquery_analytics_hub_data_exchange_iam_member" "nc" {
  project         = "my-project-id"
  location        = "us"
  data_exchange_id = "nc"

  role   = "roles/viewer"
  member = "allUsers"
}
resource "google_bigquery_analytics_hub_data_exchange_iam_member" "bad_auth" {
  project          = "my-project-id"
  location         = "us"
  data_exchange_id = "nc"

  role   = "roles/editor"
  member = "allAuthenticatedUsers"
}
resource "google_bigquery_analytics_hub_data_exchange_iam_member" "auth_viewer" {
  project          = "my-project-id"
  location         = "us"
  data_exchange_id = "nc"

  role   = "roles/viewer"
  member = "allAuthenticatedUsers"
}
