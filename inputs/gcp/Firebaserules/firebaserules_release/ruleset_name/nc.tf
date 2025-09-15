resource "google_firebaserules_release" "release_nc" {
  name        = "cloud.firestore"
  ruleset_name = "projects/abcd_1234/rulesets/99999999-abcd-1234-defg-123456789012"  # 不存在 / 格式对但无资源
  project      = data.google_project.project.project_id
}

data "google_project" "project" {}