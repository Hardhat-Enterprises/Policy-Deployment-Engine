resource "google_cloud_run_domain_mapping" "non_compliant_example_1" {
   project  = "my-gcp-project"
   location = "australia-southeast1"
   name = "non_compliant_example_1"

  metadata {
    namespace = "my-project-name"
  }

  spec {
    route_name = "nc"
      force_override   = true

  }
}
