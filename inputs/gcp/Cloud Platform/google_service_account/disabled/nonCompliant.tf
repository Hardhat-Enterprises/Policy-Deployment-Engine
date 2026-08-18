resource "google_service_account" "non_compliant_example_1" {
  account_id   = "notifier-staging"
  display_name = "Notifier staging"
  description  = "Staging notifier service account"
  project      = "not-secure-project"
  disabled     = true                                # ❌ disabled at creation
}
