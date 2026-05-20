# Compliant: Only includes authorized production projects
resource "google_logging_log_scope" "c" {
  name = "c"

  resource_names = [
    "projects/prod-security-project",
    "projects/prod-audit-project",
    "projects/prod-main-project"
  ]

  description = "Security monitoring scope for production projects"
}