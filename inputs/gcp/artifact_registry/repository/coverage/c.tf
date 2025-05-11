# Identify if fields like description, labels, vulnerability_scanning_config are consistently applied
# Repositories should include important optional metadata fields to improve visibility, traceability, and governance. 

resource "google_artifact_registry_repository" "c" {
  repository_id = "covered-repo-c"
  format        = "DOCKER"
  location      = "AU"

  description = "Fully covered repository"
  labels = {
    environment = "prod"
  }

  vulnerability_scanning_config {
    enablement_config = "INHERITED"
  }

project = "sunny-lore-458707-v4"

}

