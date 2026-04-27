resource "google_billing_budget" "nc" {
  billing_account = "000000-0000000-0000000-000000"
  display_name    = "Example Billing Budget"
  ownership_scope = "BILLING_ACCOUNT"
  amount {
    specified_amount {
      currency_code = "AUD"
      units         = "500"
    }
  }
  all_updates_rule {
    monitoring_notification_channels = [
      "projects/project-test/notificationChannels/1234567890",
    ]
    disable_default_iam_recipients = true
  }
  threshold_rules {
    threshold_percent = 1
  }
}
