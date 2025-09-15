resource "google_firebaserules_ruleset" "ruleset_c" {
  source {
    language = "FIREBASE_RULES"
    files {
      name    = "firestore.rules"
      content = "service cloud.firestore { match /databases/{db}/documents { allow read, write: if true; } }"
    }
  }

  project = data.google_project.project.project_id
}

data "google_project" "project" {}