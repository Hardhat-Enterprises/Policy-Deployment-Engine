resource "google_assured_workloads_workload" "c" {
  display_name                    = "c"
  compliance_regime               = "ASSURED_WORKLOADS_FOR_PARTNERS"
  location                        = "australia-southeast1"
  organization                    = "123456789"
  billing_account                 = "billingAccounts/000000-000000-000000"
  violation_notifications_enabled = true
  partner                         = "SOVEREIGN_CONTROLS_BY_PSN"
  partner_permissions {
    data_logs_viewer = true
  }
}