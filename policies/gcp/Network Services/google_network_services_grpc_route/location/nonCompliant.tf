resource "google_network_services_grpc_route" "non_compliant_example_1" {
  name            = "compliant-grpc-route"
  project         = "test-project"
  location = terraform_data.non_compliant_location.output
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
