resource "google_container_attached_cluster" "non_compliant_example_1" {
  name            = "non_compliant_example_1"
  location        = "us-west1"
  project         = "fake-project-id"
  distribution    = "aks"
  deletion_policy = "DELETE_IGNORE_ERRORS"

  oidc_config {
    issuer_url = "http://oidc.issuer.url"
    jwks       = "eyJrZXlzIjpbeyJrdHkiOiJSU0EiLCJub20iOiIifV19"
  }

  platform_version = "1.29.0-gke.1"
  fleet {
    project = "projects/123456789012"
  }
}
