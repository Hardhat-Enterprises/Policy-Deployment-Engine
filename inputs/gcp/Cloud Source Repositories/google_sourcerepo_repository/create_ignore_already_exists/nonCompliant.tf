resource "google_sourcerepo_repository" "non_compliant_example_1" {
  name    = "non_compliant_example_1"
  project = "google_sourcerepo_repository.repository.project"

  create_ignore_already_exists = false

}

