resource "google_billing_budget" "nc"{
  billing_account = "000000-0000000-0000000-000000"
  display_name = "Example Billing Budget"
  ownership_scope = "ALL_USERS"
  amount {
    specified_amount {
      currency_code = "AUD"
      units = "500"
    }
  }
  threshold_rules {
      threshold_percent =  0.5
  }
}