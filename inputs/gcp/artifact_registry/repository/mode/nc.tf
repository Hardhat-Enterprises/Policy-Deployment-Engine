# Only allow repositories where mode = "STANDARD_REPOSITORY"
#This allows fetching artifacts from external sources like Docker Hub.

resource "google_artifact_registry_repository" "nc" {
  repository_id = "risky-repo-nc"
  format        = "DOCKER"
  location      = "AU"
  mode          = "REMOTE_REPOSITORY"

project = "sunny-lore-458707-v4"

}
