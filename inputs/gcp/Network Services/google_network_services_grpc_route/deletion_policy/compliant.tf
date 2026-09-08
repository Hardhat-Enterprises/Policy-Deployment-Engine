resource "google_network_services_grpc_route" "compliant_example_1" {
  name            = "compliant-grpc-route"
  project         = "test-project"
  location        = "global"
  hostnames       = ["example.com"]
  deletion_policy = "PREVENT"

  rules {
    action {
      retry_policy {
        retry_conditions = ["cancelled"]
        num_retries       = 1
      }
    }
  }
}
