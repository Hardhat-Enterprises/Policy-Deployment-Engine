# NC1: sandbox org (blocked)
resource "google_iap_web_forwarding_rule_service_iam_member" "nc1" {
  project                      = "sandbox-orders-dev"
  forwarding_rule_service_name = "orders-be-dev"
  role                         = "nc3"
  member                       = "user:jane@example.com"
}

# NC2: env 'qa' not allowed by whitelist
resource "google_iap_web_forwarding_rule_service_iam_member" "nc2" {
  project                      = "corp-orders-qa"
  forwarding_rule_service_name = "orders-be-qa"
  role                         = "nc2"
  member                       = "user:jane@example.com"
}

# NC3: workload not in approved set
resource "google_iap_web_forwarding_rule_service_iam_member" "nc3" {
  project                      = "corp-unknown-prod"
  forwarding_rule_service_name = "unknown-be-prod"
  role                         = "nc3"
  member                       = "user:jane@example.com"
}
