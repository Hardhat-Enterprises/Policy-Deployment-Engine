resource "google_container_azure_client" "nc" {
  application_id = "bad-application-id"
  location       = "us-central1"
  name           = "wrongprefix-abc"
  project        = "test-project"
  tenant_id      = "insecure-tenant"
}
