# Non-compliant Chronicle Rule Deployment with alerting disabled
resource "google_chronicle_rule_deployment" "nc" {
  project = "fake-project"
  location       = "us"
  instance       = "00000000-0000-0000-0000-000000000000"
  rule           = "example-rule-id"
  enabled        = true
  alerting       = false
  archived       = false
  run_frequency  = "DAILY"
}
