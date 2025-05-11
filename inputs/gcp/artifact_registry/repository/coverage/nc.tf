# Missing them can lead to poor resource classification, harder auditing, and increased security risk.


resource "google_artifact_registry_repository" "nc" {
  repository_id = "covered-repo-nc"
  format        = "DOCKER"
  location      = "AU"
  # Missing description, labels, vulnerability_scanning_config

project = "sunny-lore-458707-v4"

}
