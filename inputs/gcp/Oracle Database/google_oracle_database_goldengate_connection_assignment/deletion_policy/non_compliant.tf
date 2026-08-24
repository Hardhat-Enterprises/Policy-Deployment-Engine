resource "google_oracle_database_goldengate_connection_assignment" "non_compliant_example_1" {
  goldengate_connection_assignment_id = "non-compliant-example-1"
  location                            = "australia-southeast1"
  deletion_policy                     = "DELETE"

  properties {
    goldengate_connection  = "projects/test-project/locations/australia-southeast1/goldengateConnections/test-connection"
    goldengate_deployment   = "projects/test-project/locations/australia-southeast1/goldengateDeployments/test-deployment"
  }
}