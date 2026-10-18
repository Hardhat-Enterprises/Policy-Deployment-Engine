resource "google_sourcerepo_repository_iam_member" "compliant_example_1" {

  repository = "google_sourcerepo_repository.repository.name"
  role       = "roles/viewer"
  member     = "user:jane@example.com"
}
