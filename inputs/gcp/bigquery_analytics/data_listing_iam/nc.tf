# ❌ Non-compliant IAM binding (overly permissive role, bad email)
resource "google_bigquery_analytics_hub_listing_iam_binding" "bad_binding" {
  project          = "my-project"
  location         = "us"
  data_exchange_id = "exchange"
  listing_id       = "nc1"            # ❌ Non-compliant marker
  role             = "roles/owner"    # overly permissive

  members = [
    "user:baduser@example",           # ❌ invalid email format
  ]
}

# ❌ Non-compliant IAM binding (empty members list)
resource "google_bigquery_analytics_hub_listing_iam_binding" "empty_binding" {
  project          = "my-project"
  location         = "us"
  data_exchange_id = "empty_exchange"
  listing_id       = "nc2"            # ❌ Non-compliant marker
  role             = "roles/viewer"

  members = []                        # ❌ empty list
}