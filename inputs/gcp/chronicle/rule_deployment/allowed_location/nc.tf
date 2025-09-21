resource "google_chronicle_rule_deployment" "nc" {
  project      = "fake-project"  
  location     = "south-africa"
  instance     = "00000000-0000-0000-0000-000000000000"
  rule         = "nc"
  enabled      = true   
  alerting     = true
  archived     = false
  run_frequency = "DAILY"
}