resource "google_container_attached_cluster" "non_compliant_example_1" {
  name         = "non_compliant_example_1"
  location     = "us-west1"
  project      = "fake-project-id"
  description  = "Non-compliant: Monitoring Disabled"
  distribution = "aks"

  oidc_config {
    issuer_url = "http://oidc.issuer.url"
  }

  monitoring_config {
    managed_prometheus_config {
      enabled = false
    }
  }

  platform_version = "1.29.0-gke.1"
  fleet {
    project = "projects/123456789012"
  }
}
