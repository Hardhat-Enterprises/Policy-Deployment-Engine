resource "google_sourcerepo_repository_iam_member" "non_compliant_example_1" {

  repository = "invalid-repository-name"
  role       = "roles/viewer"
  member     = "user:jane@example.com"
}
