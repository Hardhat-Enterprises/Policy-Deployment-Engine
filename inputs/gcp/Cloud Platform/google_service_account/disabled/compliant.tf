resource "google_service_account" "compliant_example_1" {
  account_id   = "notifier-prod"
  display_name = "Notifier"
  description  = "Sends notifications"
  project      = "my-secure-project"
  disabled     = false                               # ✅ active
}
