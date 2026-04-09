resource "google_service_account" "c" {
  account_id   = "etl-runner-prod"
  display_name = "ETL Runner"
  description  = "Runs nightly ETL for analytics"  # ✅ non-empty
  project      = "my-secure-project"
  disabled     = false
}
