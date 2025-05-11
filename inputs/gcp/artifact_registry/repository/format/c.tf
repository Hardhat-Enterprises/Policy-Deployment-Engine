# Used to enforce standardization and reduce risks from using unsupported or experimental formats.
/*Only allow repositories with formats:
"DOCKER"
"MAVEN"

Other formats (like "NPM", "APT", "YUM", "GO") may be unsupported in your organization or introduce risk.
*/

resource "google_artifact_registry_repository" "c" {
  repository_id = "docker-repo-c"
  format        = "DOCKER"
  location      = "AU"

project = "sunny-lore-458707-v4"

}

