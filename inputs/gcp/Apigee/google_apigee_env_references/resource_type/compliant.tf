resource "google_apigee_env_references" "compliant_example_1" {
  name          = "compliant_example_1"
  env_id        = "organizations/pde-org/environments/pde-env"
  resource_type = "KeyStore"
  refers        = "pde-keystore"
}
