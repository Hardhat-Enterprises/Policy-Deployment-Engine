# Non-compliant IAM binding: overly permissive role and invalid member format
resource "google_bigquery_analytics_hub_listing_iam_binding" "bad_binding" {
  project          = "my-project"
  location         = "us"
  data_exchange_id = "bad_exchange"
  listing_id       = "bad_listing"
  role             = "roles/owner"   # ❌ Overly permissive (policy will catch this)

  members = [
    "user:baduser@example",         # ✅ Terraform accepts, ❌ invalid email format (OPA will flag)
  ]
}

# Non-compliant IAM binding: empty members list
resource "google_bigquery_analytics_hub_listing_iam_binding" "empty_binding" {
  project          = "my-project"
  location         = "us"
  data_exchange_id = "empty_exchange"
  listing_id       = "empty_listing"
  role             = "roles/viewer"

  members = []                      # ❌ empty list, policy will flag
}
