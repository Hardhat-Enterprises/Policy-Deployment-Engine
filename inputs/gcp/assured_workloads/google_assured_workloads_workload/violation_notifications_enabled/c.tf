resource "google_assured_workloads_workload" "c" {
  display_name                    = "c"
  compliance_regime               = "FEDRAMP_MODERATE"
  location                        = "us-central1"
  organization                    = "123456789"
  billing_account                 = "billingAccounts/000000-000000-000000"
  violation_notifications_enabled = true
}