resource "google_service_account" "nc" {
  account_id   = "notifier-staging"
  display_name = "Notifier staging"
  description  = "Staging notifier service account"
  project      = "not-secure-project"
  disabled     = true                                # ❌ disabled at creation
}
