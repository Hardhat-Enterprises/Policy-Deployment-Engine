resource "google_container_azure_client" "c" {
  application_id = "compliant-app-id"
  location       = "australia-southeast1"
  name           = "client-c"
  project        = "prod-project"
  tenant_id      = "12345678-aaaa-bbbb-cccc-1234567890ab"
}
