resource "google_service_account" "c" {
  account_id   = "notifier-prod"
  display_name = "Notifier"
  description  = "Sends notifications"
  project      = "my-secure-project"
  disabled     = false                               # ✅ active
}
