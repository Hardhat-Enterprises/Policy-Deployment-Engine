resource "google_service_account" "non_compliant_example_1" {
  account_id   = "etl-runner-prod"
  display_name = "ETL Runner"
  description  = ""                                  # ❌ empty (violates description policy)
  project      = "my-secure-project"
  disabled     = false
}
