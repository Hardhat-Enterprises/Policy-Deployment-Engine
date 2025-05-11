resource "google_container_azure_client" "c" {
    application_id = "compliant-id"
    location       = "australia-southeast1"
    name           = "client-c"
    project        = "approved-project"
    tenant_id      = "12345678-aaaa-bbbb-cccc-1234567890ab"
  }
  