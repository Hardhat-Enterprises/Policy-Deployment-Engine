resource "google_container_attached_cluster" "nc" {
  name         = "nc"
  location     = "us-west1"
  project      = "fake-project-id"
  description  = "Non-compliant: Missing workload logs"
  distribution = "aks"

  oidc_config {
    issuer_url = "http://oidc.issuer.url"
  }

  logging_config {
    component_config {
      enable_components = ["WORKLOADS"]
    }
  }

  platform_version = "1.29.0-gke.1"
  fleet {
    project = "projects/123456789012"
  }
}