resource "google_bigquery_analytics_hub_listing_iam_binding" "nc" {
  project          = "my-project"
  location         = "europe-west1"  # ❌ Not allowed
  data_exchange_id = "Bad*Exchange!" # ❌ Invalid chars
  listing_id       = "Bad Listing!"  # ❌ Invalid chars
  role             = "roles/owner"   # ❌ Too much privilege
  members = [
    "allUsers", # ❌ Overly permissive
  ]
}
