resource "google_container_azure_client" "c" {
  application_id = "87654321-bbbb-aaaa-dddd-0987654321cd"
  location       = "australia-southeast1"
  name           = "client-001"
  project        = "prod-project"
  tenant_id      = "12345678-aaaa-bbbb-cccc-1234567890ab"
}
