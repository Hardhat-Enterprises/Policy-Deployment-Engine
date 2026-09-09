resource "google_container_attached_cluster" "non_compliant_example_1" {
  name         = "non_compliant_example_1"
  location     = "australia-southeast1"
  project      = "fake-project-id"
  description  = "Compliant cluster on modern platform version"
  distribution = "aks"

  oidc_config {
    issuer_url = "https://oidc.issuer.url"
  }

  platform_version = "1.29.0-gke.1"

  fleet {
    project = "projects/123456789012"
  }
}
