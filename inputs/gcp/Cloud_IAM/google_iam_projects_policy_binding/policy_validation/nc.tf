resource "google_iam_projects_policy_binding" "nc" {
  project           = "my-project"
  location          = "global"
  display_name      = "invalid binding"
  policy_kind       = "PRINCIPAL_ACCESS_BOUNDARY"
  policy_binding_id = "binding-nc"

  policy = ""

  target {
    principal_set = "//cloudresourcemanager.googleapis.com/projects/my-project"
  }
}