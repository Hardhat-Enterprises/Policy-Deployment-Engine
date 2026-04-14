resource "google_assured_workloads_workload" "nc" {
  display_name      = "nc"
  compliance_regime = "COMPLIANCE_REGIME_UNSPECIFIED"
  location          = "us-central1"
  organization      = "123456789"
  billing_account   = "billingAccounts/000000-000000-000000"
}