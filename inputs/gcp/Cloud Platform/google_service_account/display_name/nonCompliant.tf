resource "google_service_account" "non_compliant_example_1" {
  account_id   = "reporting-agent-prod"
  display_name = "root-service"                      # ❌ risky term (blacklist)
  description  = "Generates daily reports"
  project      = "my-secure-project"
  disabled     = false
}

