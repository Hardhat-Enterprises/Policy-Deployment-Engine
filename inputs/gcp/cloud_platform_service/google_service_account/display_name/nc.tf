resource "google_service_account" "nc" {
  account_id   = "reporting-agent-staging"
  display_name = "root-service"                      # ❌ risky term (blacklist)
  description  = "Generates daily reports"
  project      = "not-secure-project"
  disabled     = false
}


