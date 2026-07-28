resource "google_service_account" "compliant_example_1" {
  account_id   = "payments-batcher-prod"             # ✅ safe
  display_name = "Payments Batch Processor"
  description  = "Batches payments"
  project      = "my-secure-project"
  disabled     = false
}
