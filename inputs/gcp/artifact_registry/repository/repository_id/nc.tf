
resource "google_artifact_registry_repository" "nc" {
  repository_id = "ProdRepo123!!"
  format        = "DOCKER"
  location      = "AU"

project = "sunny-lore-458707-v4"


}
