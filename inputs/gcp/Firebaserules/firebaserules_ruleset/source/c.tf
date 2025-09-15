resource "google_firebaserules_ruleset" "ruleset_nc" {
  source {
    language = "FIREBASE_RULES"
    files {
      # 缺少 content 字段 → 违反 contains_all_keys
      name = "firestore.rules"
    }
  }
  project = data.google_project.project.project_id
}