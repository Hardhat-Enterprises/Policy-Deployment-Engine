resource "google_bigquery_connection_iam_policy" "c" {
  project = "pde_pro"
  location = "AUSTRALIA-SOUTHEAST1"
  connection_id = "connection_id"
  policy_data = "policy_data"
}