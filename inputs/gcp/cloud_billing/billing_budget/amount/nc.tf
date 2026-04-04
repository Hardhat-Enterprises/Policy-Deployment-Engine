# Describe your resource type here
# Keep "nc" as the name to indicate that this resource and its attributes are non-compliant

data "google_billing_account" "nc" {
  billing_account = "000000-0000000-0000000-000000"
}

resource "google_billing_budget" "budget" {
  billing_account = data.google_billing_account.account.id
  display_name = "Example Billing Budget"
  ownership_scope = "BILLING_ACCOUNT"
  amount {
    specified_amount {
      currency_code = "USD"
      units = ""
    }
  }
  threshold_rules {
      threshold_percent =  0.5
  }
}