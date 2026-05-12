resource "google_apigee_env_references" "nc" {
  name          = "nc"
  env_id        = "organizations/pde-org/environments/pde-env"
  resource_type = "InvalidType"
  refers        = "pde-keystore"
}