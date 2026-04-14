# Non-compliant: Excluding high severity logs
resource "google_logging_project_exclusion" "nc1" {
  name        = "severity-exclusion"
  project     = "my-project"
  description = "Excluding ERROR logs - VIOLATION"

  filter = "severity >= ERROR"
}