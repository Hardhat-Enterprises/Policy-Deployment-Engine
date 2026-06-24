resource "google_cloud_run_domain_mapping" "compliant_example_1" {
  project  = "my-gcp-project"
  location = "australia-southeast1"
  name = "compliant_example_1"

  metadata {
    namespace = "my-project-name"
    labels = {
    env = "prod"
  }
  }

  spec {
    route_name = "c"
  }
}
