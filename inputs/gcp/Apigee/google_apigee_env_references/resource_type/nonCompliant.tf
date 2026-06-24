resource "google_apigee_env_references" "non_compliant_example_1" {
  name          = "non_compliant_example_1"
  env_id        = "organizations/pde-org/environments/pde-env"
  resource_type = "InvalidType"
  refers        = "pde-keystore"
}
