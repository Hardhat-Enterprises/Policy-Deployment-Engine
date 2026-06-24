resource "google_chronicle_rule_deployment" "non_compliant_example_1" {
  project       = "fake-project"
  location      = "south-africa"
  instance      = "00000000-0000-0000-0000-000000000000"
  rule          = "non_compliant_example_1"
  enabled       = true
  alerting      = true
  archived      = false
  run_frequency = "DAILY"
}
