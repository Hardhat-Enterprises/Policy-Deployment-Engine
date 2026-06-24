resource "google_sourcerepo_repository_iam_member" "compliant_example_1" {
  repository = "google_sourcerepo_repository.repository.project"
  role       = "roles/source.writer"
  member     = "user:jane@example.com"
}

resource "google_sourcerepo_repository_iam_member" "compliant_example_2" {
  repository = "google_sourcerepo_repository.repository.project"
  role       = "roles/source.reader"
  member     = "user:jane@example.com"
}
