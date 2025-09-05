# Compliant Chronicle Rule Deployment with alerting enabled
resource "google_chronicle_rule_deployment" "c" {
  project = "fake-project"  
  location       = "us"
  instance       = "00000000-0000-0000-0000-000000000000"
  rule           = "alerting enabled-c"
  enabled        = true
  alerting       = true
  archived       = false
  run_frequency  = "DAILY"
}
