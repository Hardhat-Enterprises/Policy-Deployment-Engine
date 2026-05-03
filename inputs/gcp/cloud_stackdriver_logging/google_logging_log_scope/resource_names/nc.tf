# Non-compliant: Includes unauthorized projects
resource "google_logging_log_scope" "nc" {
  name = "nc"

  resource_names = [
    "projects/prod-project",
    "projects/attacker-project", # Unauthorized external project
    "projects/test-dev-project", # Development project (noise)
    "projects/sandbox-project"   # Sandbox project
  ]

  description = "Insecure scope with unauthorized projects"
}