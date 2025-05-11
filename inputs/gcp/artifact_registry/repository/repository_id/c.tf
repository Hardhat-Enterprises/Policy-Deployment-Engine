# Enforce naming conventions (e.g., prod-*, dev-*)
# Prevent creation of vague or misleading repository names

# [a-z0-9-]+	One or more lowercase letters (a–z), digits (0–9), or hyphens (-)

resource "google_artifact_registry_repository" "c" {
  repository_id = "prod-app-repo"
  format        = "DOCKER"
  location      = "AU"

project = "sunny-lore-458707-v4"

}

