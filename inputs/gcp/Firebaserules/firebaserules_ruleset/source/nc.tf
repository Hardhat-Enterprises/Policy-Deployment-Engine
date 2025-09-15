resource "google_firebaserules_ruleset" "ruleset_nc" {
  # 完全缺失 source 块 → 语言、文件均空，policy 会报缺失
  project = data.google_project.project.project_id
}

data "google_project" "project" {}