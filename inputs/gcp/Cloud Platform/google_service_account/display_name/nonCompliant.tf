resource "google_service_account" "non_compliant_example_1" {
  account_id   = "reporting-agent-staging"
  display_name = "root-service"                      # ❌ risky term (blacklist)
  description  = "Generates daily reports"
  project      = "not-secure-project"
  disabled     = false
}

