resource "google_cloud_run_domain_mapping" "non_compliant_example_1" {
  project  = "my-gcp-project"
  location = "us-central1"
  name = "non_compliant_example_1"

  metadata {
    namespace = "my-project-name"

    annotations = {
      ticket = "SEC-invalid"
    }
  }

  spec {
    route_name = "nc"
  }
}
