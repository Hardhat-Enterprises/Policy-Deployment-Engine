resource "google_service_account" "compliant_example_1" {
  account_id   = "etl-runner-prod"
  display_name = "ETL Runner"
  description  = "Runs nightly ETL for analytics"  # ✅ non-empty
  project      = "my-secure-project"
  disabled     = false
}
