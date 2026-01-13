resource "google_bigquery_analytics_hub_data_exchange_iam_member" "nc" {
  project          = "pde-test-project"
  location         = "australia-southeast1"
  data_exchange_id = "nc_exchange"
  role             = "roles/viewer"
  member           = "allUsers"
}
