resource "google_assured_workloads_workload" "nc" {
  display_name                    = "nc"
  compliance_regime               = "FEDRAMP_MODERATE"
  location                        = "australia-southeast1"
  organization                    = "123456789"
  billing_account                 = "billingAccounts/000000-000000-000000"
  violation_notifications_enabled = true
  kms_settings {
    next_rotation_time = "9999-10-02T15:01:23Z"
    rotation_period    = "31536000s"
  }
}