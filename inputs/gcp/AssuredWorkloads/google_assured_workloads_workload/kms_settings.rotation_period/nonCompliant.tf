resource "google_assured_workloads_workload" "non_compliant_example_1" {
  display_name                    = "non_compliant_example_1"
  compliance_regime               = "FEDRAMP_MODERATE"
  location                        = "us-central1"
  organization                    = "123456789"
  billing_account                 = "billingAccounts/000000-000000-000000"
  violation_notifications_enabled = true
  kms_settings {
    next_rotation_time = "9999-10-02T15:01:23Z"
    rotation_period    = "31536000s"
  }
}
