resource "google_container_attached_cluster" "compliant_example_1" {
  name         = "compliant_example_1"
  location     = "australia-southeast1"
  project      = "fake-project-id"
  description  = "Compliant: All logging enabled"
  distribution = "aks"

  oidc_config {
    issuer_url = "https://oidc.issuer.url"
  }

  logging_config {
    component_config {
      enable_components = ["SYSTEM_COMPONENTS"]
    }
  }

  platform_version = "1.29.0-gke.1"
  fleet {
    project = "projects/123456789012"
  }
}
