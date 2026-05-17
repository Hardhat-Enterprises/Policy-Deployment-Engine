# Non-compliant: Excluding high severity logs
resource "google_logging_project_exclusion" "nc" {
  name        = "nc"
  project     = "my-project"
  description = "Excluding ERROR logs - VIOLATION"
  filter      = "severity >= ERROR"
}