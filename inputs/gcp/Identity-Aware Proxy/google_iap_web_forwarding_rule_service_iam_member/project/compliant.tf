resource "google_iap_web_forwarding_rule_service_iam_member" "compliant_example_1" {
  project                      = "corp-orders-prod"
  forwarding_rule_service_name = "orders-be-prod"
  role                         = "c"
  member                       = "user:jane@example.com"
}
