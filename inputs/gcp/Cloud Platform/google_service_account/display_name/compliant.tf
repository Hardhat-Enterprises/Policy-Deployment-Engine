resource "google_service_account" "compliant_example_1" {
  account_id   = "reporting-agent-prod"
  display_name = "Reporting Agent"                   # ✅ safe
  description  = "Generates daily reports"
  project      = "my-secure-project"
  disabled     = false
}
