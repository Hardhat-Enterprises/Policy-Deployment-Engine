# Describe your resource type here
# Keep "c" as the name to indicate that this resource and its attributes are compliant

resource "google_chronicle_rule_deployment" "c" {
  project      = "fake-project"  
  location     = "us"
  instance     = "00000000-0000-0000-0000-000000000000"
  rule         = "projects/my-project/locations/us/instances/00000000-0000-0000-0000-000000000000/rules/my-rule"
  enabled      = true      # Ensuring the rule is enabled, compliant
  alerting     = true
  archived     = false
  run_frequency = "DAILY"
}
