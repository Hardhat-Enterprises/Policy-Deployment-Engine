resource "google_chronicle_rule_deployment" "compliant_example_1" {
  project       = "fake-project"
  location      = "australia-southeast1"
  instance      = "00000000-0000-0000-0000-000000000000"
  rule          = "compliant_example_1"
  enabled       = true
  alerting      = true
  archived      = false
  run_frequency = "DAILY"
}
