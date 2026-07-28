resource "google_container_attached_cluster" "compliant_example_1" {
  name         = "compliant_example_1"
  location     = "australia-southeast1"
  project      = "fake-project-id"
  description  = "Compliant: Monitoring Enabled"
  distribution = "aks"

  oidc_config {
    issuer_url = "https://oidc.issuer.url"
  }

  monitoring_config {
    managed_prometheus_config {
      enabled = true
    }
  }

  platform_version = "1.29.0-gke.1"
  fleet {
    project = "projects/123456789012"
  }
}
