resource "google_container_azure_client" "nc" {
  name            = "client-nc"
  location        = "global"  # Blacklisted region
  tenant_id       = "insecure-tenant"
  application_id  = "missing-tenant-id"
  project         = "test-project"
}
