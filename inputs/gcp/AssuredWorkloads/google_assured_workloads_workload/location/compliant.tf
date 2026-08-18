resource "google_assured_workloads_workload" "compliant_example_1" {
  display_name                    = "compliant_example_1"
  compliance_regime               = "FEDRAMP_MODERATE"
  location                        = "australia-southeast1"
  organization                    = "123456789"
  billing_account                 = "billingAccounts/000000-000000-000000"
  violation_notifications_enabled = true
}
