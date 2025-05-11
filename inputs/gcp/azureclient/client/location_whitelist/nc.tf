resource "google_container_azure_client" "nc" {
  application_id = "noncompliant-app-id"
  location       = "global"
  name           = "client-nc"
  project        = "dev-project"
  tenant_id      = "insecure-tenant"
}
