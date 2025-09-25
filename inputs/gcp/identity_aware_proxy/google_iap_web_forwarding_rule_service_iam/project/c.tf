resource "google_iap_web_forwarding_rule_service_iam_member" "c" {
  project                      = "corp-orders-prod"
  forwarding_rule_service_name = "orders-be-prod"
  role                         = "c"
  member                       = "user:jane@example.com"
}
