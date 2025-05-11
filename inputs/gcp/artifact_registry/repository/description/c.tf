# Ensuring that artifact repositories have meaningful descriptions
# A missing or vague description makes it harder to review what a repository is for, 
# which can lead to misuse or misconfiguration.

resource "google_artifact_registry_repository" "c" {
  repository_id = "secure-repo-c"
  format        = "DOCKER"
  location      = "AU"
  description   = "Repository for production container artifacts"

project = "sunny-lore-458707-v4"

}

