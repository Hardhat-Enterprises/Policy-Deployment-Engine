resource "google_container_attached_cluster" "compliant_example_1" {
  name         = "compliant_example_1"
  location     = "australia-southeast1"
  project      = "fake-project-id"
  description  = "Test cluster"
  distribution = "aks"
  oidc_config {
    issuer_url = "https://oidc.issuer.url"
  }
  # Use a static string instead of a data source
  platform_version = "1.27.0-gke.1"
  fleet {
    project = "projects/123456789"
  }
}
