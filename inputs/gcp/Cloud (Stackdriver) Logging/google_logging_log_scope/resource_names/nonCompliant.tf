# Non-compliant: Includes unauthorized projects
resource "google_logging_log_scope" "non_compliant_example_1" {
  name = "non_compliant_example_1"

  resource_names = [
    "projects/prod-project",
    "projects/attacker-project", # Unauthorized external project
    "projects/test-dev-project", # Development project (noise)
    "projects/sandbox-project"   # Sandbox project
  ]

  description = "Insecure scope with unauthorized projects"
}
