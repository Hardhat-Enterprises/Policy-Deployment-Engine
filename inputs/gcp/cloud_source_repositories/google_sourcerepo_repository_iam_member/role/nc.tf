resource "google_sourcerepo_repository_iam_member" "nc" {
  repository = "google_sourcerepo_repository.repository.project"
  role       = "roles/source.admin"
  member     = "user:jane@example.com"
}
