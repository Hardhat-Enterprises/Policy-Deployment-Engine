resource "google_cloud_run_domain_mapping" "compliant_example_1" {
  project = "my-gcp-project"
  location = "australia-southeast1"
  name     = "app.company.com"###

  metadata {
    namespace = "my-project-name"
  }

  spec {
    route_name = "c"
  }
}
