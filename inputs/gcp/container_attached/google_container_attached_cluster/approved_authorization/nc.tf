resource "google_container_attached_cluster" "nc" {
  name         = "nc"
  location     = "us-west1"
  project      = "fake-project-id"
  distribution = "aks"

  oidc_config {
    issuer_url = "http://oidc.issuer.url"
  }

  authorization {
    admin_groups = ["xyz@random.com"]

  }

  platform_version = "1.29.0-gke.1"
  fleet {
    project = "projects/123456789012"
  }
}