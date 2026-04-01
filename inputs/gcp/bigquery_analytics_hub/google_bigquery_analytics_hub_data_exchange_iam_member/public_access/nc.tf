# BigQuery Analytics Hub Data Exchange IAM Member (NON-COMPLIANT)
# Non-compliant because member is public (allUsers / allAuthenticatedUsers)

resource "google_bigquery_analytics_hub_data_exchange_iam_member" "nc1" {
  project         = "my-project-id"
  location        = "us"
  data_exchange_id = "nc1"

  role   = "roles/viewer"
  member = "allUsers"
}
resource "google_bigquery_analytics_hub_data_exchange_iam_member" "nc2" {
  project          = "my-project-id"
  location         = "us"
  data_exchange_id = "nc2"

  role   = "roles/editor"
  member = "allAuthenticatedUsers"
}
resource "google_bigquery_analytics_hub_data_exchange_iam_member" "nc3" {
  project          = "my-project-id"
  location         = "us"
  data_exchange_id = "nc3"

  role   = "roles/viewer"
  member = "allAuthenticatedUsers"
}
