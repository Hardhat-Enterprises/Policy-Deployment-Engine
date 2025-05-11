

resource "google_artifact_registry_repository" "nc" {
  repository_id = "secure-repo-nc"
  format        = "DOCKER"
  location      = "AU"
  
  # No description added (non-compliant)

project = "sunny-lore-458707-v4"

}
