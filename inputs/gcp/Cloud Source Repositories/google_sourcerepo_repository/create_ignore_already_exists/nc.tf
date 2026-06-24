resource "google_sourcerepo_repository" "nc" {
  name    = "nc"
  project = "google_sourcerepo_repository.repository.project"

  create_ignore_already_exists = false

}

