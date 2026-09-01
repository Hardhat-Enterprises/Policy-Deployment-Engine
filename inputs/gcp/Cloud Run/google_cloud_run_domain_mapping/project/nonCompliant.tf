resource "google_cloud_run_domain_mapping" "non_compliant_example_1" {
   project = "wrong-project-id" ###
   location = "australia-southeast1"
   name = "non_compliant_example_1"

  metadata {
    namespace = "my-project-name"
  }

  spec {
    route_name = "c"
  }
}
