resource "google_sourcerepo_repository_iam_member" "nc" {

  repository = "invalid-repository-name"
  role       = "roles/viewer"
  member     = "user:jane@example.com"
}