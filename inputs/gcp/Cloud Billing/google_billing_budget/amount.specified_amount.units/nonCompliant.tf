resource "google_billing_budget" "non_compliant_example_1" {
  billing_account = "000000-0000000-0000000-000000"
  display_name    = "Example Billing Budget"
  ownership_scope = "BILLING_ACCOUNT"
  amount {
    specified_amount {
      currency_code = "AUD"
      units         = "2000000"
    }
  }
  threshold_rules {
    threshold_percent = 1
  }
}
