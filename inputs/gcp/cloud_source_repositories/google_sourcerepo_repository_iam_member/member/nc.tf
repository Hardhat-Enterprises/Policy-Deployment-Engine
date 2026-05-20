resource "google_sourcerepo_repository_iam_member" "nc1" {

  repository = "google_sourcerepo_repository.repository.project"

  role   = "roles/viewer"
  member = "allAuthenticatedUsers"
}

resource "google_sourcerepo_repository_iam_member" "nc2" {

  repository = "google_sourcerepo_repository.repository.project"

  role   = "roles/viewer"
  member = "allUsers"
}
