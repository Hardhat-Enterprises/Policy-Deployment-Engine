resource "google_chronicle_rule_deployment" "nc" {
  project      = "fake-project"  
  location     = "australia-southeast1"
  instance     = "00000000-0000-0000-0000-000000000000"
  rule         = "nc"
  enabled      = false  
  alerting     = true
  archived     = false
  run_frequency = "DAILY"
}
