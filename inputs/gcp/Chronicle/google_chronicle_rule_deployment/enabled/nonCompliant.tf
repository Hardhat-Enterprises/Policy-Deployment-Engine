resource "google_chronicle_rule_deployment" "non_compliant_example_1" {
  project       = "fake-project"
  location      = "australia-southeast1"
  instance      = "00000000-0000-0000-0000-000000000000"
  rule          = "non_compliant_example_1"
  enabled       = false
  alerting      = true
  archived      = false
  run_frequency = "DAILY"
}
