
resource "google_artifact_registry_repository" "nc" {
  repository_id = "region-repo-nc"
  format        = "DOCKER"
  location      = "us"  # Example of a disallowed region

project = "sunny-lore-458707-v4"


}
