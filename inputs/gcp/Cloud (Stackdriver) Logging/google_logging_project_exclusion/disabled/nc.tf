# Non-compliant: Exclusion is disabled
resource "google_logging_project_exclusion" "nc1" {
  name        = "nc1"
  project     = "my-project"
  description = "Disabled exclusion - VIOLATION"
  disabled    = true
  filter      = "resource.type = \"gce_instance\" AND logName = \"disk-usage\""
}

# Non-compliant: Security exclusion that's disabled
resource "google_logging_project_exclusion" "nc2" {
  name        = "nc2"
  project     = "my-project"
  description = "Security exclusion disabled - VIOLATION"
  disabled    = true
  filter      = "severity >= ERROR"
}