# Ensure that all artifact registry repositories include at least one label for resource classification 
#(e.g., environment, team ownership)

resource "google_artifact_registry_repository" "c" {
  repository_id = "labeled-repo-c"
  format        = "DOCKER"
  location      = "AU"

  labels = {
    environment = "prod"
    team        = "security"
  }

project = "sunny-lore-458707-v4"

}
