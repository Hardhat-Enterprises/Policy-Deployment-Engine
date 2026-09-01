resource "google_container_attached_cluster" "non_compliant_example_1" {
  name         = "non_compliant_example_1"
  location     = "us-west1"
  project      = "fake-project-id"
  description  = "Compliant cluster with valid JWKS"
  distribution = "aks"

  oidc_config {
    issuer_url = "http://oidc.issuer.url"
    jwks       = ""
  }

  platform_version = "1.27.0-gke.1"
  fleet {
    project = "projects/123456789"
  }
}
