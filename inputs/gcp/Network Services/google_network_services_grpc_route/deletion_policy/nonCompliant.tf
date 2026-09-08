resource "google_network_services_grpc_route" "non_compliant_example_1" {
  name            = "noncompliant-grpc-route"
  project         = "test-project"
  location        = "global"
  hostnames       = ["example.com"]
  deletion_policy = "DELETE"

  rules {
    action {
      retry_policy {
        retry_conditions = ["cancelled"]
        num_retries       = 1
      }
    }
  }
}
