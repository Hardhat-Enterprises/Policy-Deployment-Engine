resource "google_sourcerepo_repository_iam_member" "c" {

  repository = "google_sourcerepo_repository.repository.name"
  role       = "roles/viewer"
  member     = "user:jane@example.com"
}