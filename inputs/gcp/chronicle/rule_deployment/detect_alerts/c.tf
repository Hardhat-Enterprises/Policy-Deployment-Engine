
resource "google_chronicle_rule_deployment" "c" {
  project = "fake-project"  
  location       = "australia-southeast1"
  instance       = "00000000-0000-0000-0000-000000000000"
  rule           = "c"
  enabled        = true
  alerting       = true
  archived       = false
  run_frequency  = "DAILY"
}
