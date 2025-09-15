resource "google_firebaserules_ruleset" "ruleset_nc" {
  source {
    language = "LANGUAGE_UNSPECIFIED"  # 不在白名单
    files {
      name    = "firestore.rules"
      content = "service cloud.firestore { match /databases/{db}/documents { allow read, write: if true; } }"
    }
  }

  project = data.google_project.project.project_id
}

data "google_project" "project" {}