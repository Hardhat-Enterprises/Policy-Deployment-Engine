# Non-compliant: Excluding high severity logs
resource "google_logging_project_exclusion" "non_compliant_example_1" {
  name        = "non_compliant_example_1"
  project     = "my-project"
  description = "Exclude health check logs - COMPLIANT"
  filter      = "severity >= ERROR"
}
