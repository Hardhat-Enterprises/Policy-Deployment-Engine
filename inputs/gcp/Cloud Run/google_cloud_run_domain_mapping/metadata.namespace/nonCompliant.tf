resource "google_cloud_run_domain_mapping" "non_compliant_example_1" {
   project = "my-gcp-project"
   location = "us-west1"
   name = "non_compliant_example_1"

  metadata {
    namespace = "wrong-project"
  }

  spec {
    route_name = "nc"
  }
}
