resource "google_container_azure_client" "nc" {
  application_id = "noncompliant-id"
  location       = "us-central1"
  name           = "client-nc"
  project        = "unauthorized-project"
  tenant_id      = "insecure-tenant"
}
