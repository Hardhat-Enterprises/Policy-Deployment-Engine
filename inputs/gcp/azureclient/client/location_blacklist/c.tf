resource "google_container_azure_client" "c" {
    name            = "client-c"
    location        = "australia-southeast1"
    tenant_id       = "12345678-aaaa-bbbb-cccc-1234567890ab"
    application_id  = "87654321-bbbb-aaaa-dddd-0987654321cd"
    project         = "valid-project"
  }
  