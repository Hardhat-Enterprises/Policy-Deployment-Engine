resource "google_assured_workloads_workload" "non_compliant_example_1" {
  display_name                    = "non_compliant_example_1"
  compliance_regime               = "ASSURED_WORKLOADS_FOR_PARTNERS"
  location                        = "us-central1"
  organization                    = "123456789"
  billing_account                 = "billingAccounts/000000-000000-000000"
  violation_notifications_enabled = true
  partner                         = "SOVEREIGN_CONTROLS_BY_PSN"
  partner_permissions {
    assured_workloads_monitoring = false
  }
}
