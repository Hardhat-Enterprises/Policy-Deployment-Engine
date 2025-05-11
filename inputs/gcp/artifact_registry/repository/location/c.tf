# Restrict Artifact Registry repositories to approved regions only 
#(e.g., within Australia for data sovereignty or compliance reasons)

resource "google_artifact_registry_repository" "c" {
  repository_id = "region-repo-c"
  format        = "DOCKER"
  location      = "AU"

project = "sunny-lore-458707-v4"

}

