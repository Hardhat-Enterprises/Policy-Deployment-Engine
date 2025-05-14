resource "google_container_azure_client" "nc" {
  name         = "client-nc"
  location     = "china-north1"
  tenant_id    = "87654321-bbbb-aaaa-dddd-0987654321cd"
  application_id = "12345678-aaaa-bbbb-cccc-1234567890ab"
}
