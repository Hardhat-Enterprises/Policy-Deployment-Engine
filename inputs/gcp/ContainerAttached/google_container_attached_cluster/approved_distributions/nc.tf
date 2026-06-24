resource "google_container_attached_cluster" "nc" {
  name        = "nc"
  location    = "us-west1"
  project     = "fake-project-id"
  description = "Non-compliant cluster using generic distribution"

  distribution = "generic"

  oidc_config {
    issuer_url = "http://oidc.issuer.url"
  }

  platform_version = "1.27.0-gke.1"

  fleet {
    project = "projects/123456789012"
  }
}