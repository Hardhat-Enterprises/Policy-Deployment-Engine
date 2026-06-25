resource "google_sourcerepo_repository_iam_member" "non_compliant_example_1" {

  repository = "google_sourcerepo_repository.repository.project"

  role   = "roles/viewer"
  member = "allAuthenticatedUsers"
}

resource "google_sourcerepo_repository_iam_member" "non_compliant_example_2" {

  repository = "google_sourcerepo_repository.repository.project"

  role   = "roles/viewer"
  member = "allUsers"
}
