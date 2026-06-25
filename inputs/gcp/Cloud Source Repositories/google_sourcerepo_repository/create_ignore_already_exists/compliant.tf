resource "google_sourcerepo_repository" "compliant_example_1" {
  name    = "compliant_example_1"
  project = "google_sourcerepo_repository.repository.project"

  create_ignore_already_exists = true
}

