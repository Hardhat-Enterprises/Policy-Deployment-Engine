resource "google_service_account" "c" {
  account_id   = "payments-batcher-prod"             # ✅ safe
  display_name = "Payments Batch Processor"
  description  = "Batches payments"
  project      = "my-secure-project"
  disabled     = false
}
