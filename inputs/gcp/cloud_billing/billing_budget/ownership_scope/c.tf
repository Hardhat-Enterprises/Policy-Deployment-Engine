# Describe your resource type here
# Keep "c" as the name to indicate that this resource and its attributes are compliant

resource "google_billing_budget" "c" {
  billing_account = "000000-0000000-0000000-000000"
  display_name = "Example Billing Budget"
  ownership_scope = "BILLING_ACCOUNT"
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