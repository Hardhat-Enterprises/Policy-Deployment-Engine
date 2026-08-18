resource "google_assured_workloads_workload" "non_compliant_example_1" {
  display_name      = "non_compliant_example_1"
  compliance_regime = "COMPLIANCE_REGIME_UNSPECIFIED"
  location          = "us-central1"
  organization      = "123456789"
  billing_account   = "billingAccounts/000000-000000-000000"
}
