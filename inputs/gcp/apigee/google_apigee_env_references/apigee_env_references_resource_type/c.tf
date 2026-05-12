resource "google_apigee_env_references" "c" {
  name          = "c"
  env_id        = "organizations/pde-org/environments/pde-env"
  resource_type = "KeyStore"
  refers        = "pde-keystore"
}