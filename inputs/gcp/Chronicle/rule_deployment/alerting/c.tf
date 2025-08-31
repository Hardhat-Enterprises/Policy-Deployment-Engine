# Compliant Chronicle Rule Deployment with alerting enabled
resource "google_chronicle_rule_deployment" "c" {
  project = "fake-project"  
  location       = "us"
  instance       = "00000000-0000-0000-0000-000000000000"
  rule           = "example-rule-id"
  enabled        = true
  alerting       = true
  archived       = false
  run_frequency  = "DAILY"
}
