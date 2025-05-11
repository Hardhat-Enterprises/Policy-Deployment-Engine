
resource "google_artifact_registry_repository" "nc" {
  repository_id = "labeled-repo-nc"
  format        = "DOCKER"
  location      = "AU"
  # Missing labels

project = "sunny-lore-458707-v4"

}
