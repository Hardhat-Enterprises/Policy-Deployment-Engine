resource "google_service_account" "non_compliant_example_1" {
  account_id   = "notifier-prod"
  display_name = "Notifier"
  description  = "Sends notifications"
  project      = "my-secure-project"
  disabled     = true                                # ❌ disabled at creation
}
