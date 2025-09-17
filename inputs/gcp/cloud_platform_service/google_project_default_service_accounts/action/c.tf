resource "google_project_default_service_accounts" "c1" {
  project        = "proj-security-prod"
  action         = "DEPRIVILEGE"
  restore_policy = "REVERT"
}
