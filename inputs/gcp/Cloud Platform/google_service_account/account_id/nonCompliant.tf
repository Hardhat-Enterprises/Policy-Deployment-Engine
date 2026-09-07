resource "google_service_account" "non_compliant_example_1" {
  account_id   = "administration"                    # ❌ risky term (blacklist)
  display_name = "Payments Batch Processor"
  description  = "Batches payments"
  project      = "my-secure-project"
  disabled     = false
}
