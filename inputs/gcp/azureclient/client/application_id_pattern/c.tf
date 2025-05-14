resource "google_container_azure_client" "c" {
  application_id = "app-123456789012"
  location       = "australia-southeast1"
  name           = "client-c"
  project        = "true"
  tenant_id      = "tenant-1"
}
