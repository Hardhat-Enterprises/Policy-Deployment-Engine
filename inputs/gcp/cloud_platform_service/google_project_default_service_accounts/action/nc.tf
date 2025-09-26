resource "google_project_default_service_accounts" "nc1" {
  project        = "proj-app-test"
  action         = "DELETE"
  restore_policy = "REVERT"
}

resource "google_project_default_service_accounts" "nc2" {
  project        = "proj-app-test"
  action         = "DISABLE"
  restore_policy = "REVERT_AND_IGNORE_FAILURE"
}
