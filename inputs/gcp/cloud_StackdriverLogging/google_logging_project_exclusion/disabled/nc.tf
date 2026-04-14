# Non-compliant: Exclusion is disabled (true)
resource "google_logging_project_exclusion" "nc" {
  name        = "disabled-exclusion"
  project     = "my-project"
  description = "Disabled exclusion - VIOLATION"
  disabled    = true

  filter = "resource.type = \"gce_instance\" AND logName = \"disk-usage\""
}

# Non-compliant: Security exclusion that's disabled
resource "google_logging_project_exclusion" "nc2" {
  name        = "disabled-security-exclusion"
  project     = "my-project"
  description = "Security exclusion disabled - VIOLATION"
  disabled    = true

  filter = "severity >= ERROR"
}