# Non-compliant IAM Binding - risky role
resource "google_bigquery_analytics_hub_data_exchange_iam_binding" "nc1" {
  project          = "my-sample-project"
  location         = "US"
  data_exchange_id = "bad_exchange1"
  role             = "roles/owner"   # ❌ overly permissive

  members = [
    "user:bob@example.com",
  ]
}

# Non-compliant IAM Binding - risky members
resource "google_bigquery_analytics_hub_data_exchange_iam_binding" "nc2" {
  project          = "my-sample-project"
  location         = "US"
  data_exchange_id = "bad_exchange2"
  role             = "roles/viewer"

  members = [
    "allUsers",  # ❌ risky global access
  ]
}
