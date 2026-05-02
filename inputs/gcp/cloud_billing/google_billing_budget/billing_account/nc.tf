resource "google_billing_budget" "nc" {
  billing_account = ""
  display_name    = "Example Billing Budget"
  ownership_scope = "BILLING_ACCOUNT"
  amount {
    specified_amount {
      currency_code = "AUD"
      units         = "500"
    }
  }
  threshold_rules {
    threshold_percent = 1
  }
}