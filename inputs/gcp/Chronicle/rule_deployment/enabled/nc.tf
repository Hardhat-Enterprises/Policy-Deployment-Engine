# Describe your resource type here
# Keep "nc" as the name to indicate that this resource and its attributes are non-compliant

resource "google_chronicle_rule_deployment" "nc" {
  project      = "fake-project"  
  location     = "us"
  instance     = "00000000-0000-0000-0000-000000000000"
  rule         = "projects/my-project/locations/us/instances/00000000-0000-0000-0000-000000000000/rules/my-rule"
  enabled      = false     # This is non-compliant, should be true for compliance
  alerting     = true
  archived     = false
  run_frequency = "DAILY"
}
